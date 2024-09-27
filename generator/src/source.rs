use std::{
    collections::BTreeMap,
    fs::File,
    path::{Path, PathBuf},
    process::{Output, Stdio},
    sync::Arc,
};

use anyhow::{anyhow, bail, ensure, Context, Result};
use base64::{engine::general_purpose::STANDARD, Engine as _};
use reqwest::Url;
use serde::{Deserialize, Serialize};
use tokio::{
    io::{AsyncReadExt, BufReader},
    process::{Child, Command},
    select,
    sync::{OnceCell, Semaphore},
};
use tracing::{debug, info, warn};

use crate::config::ConfigRef;

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord, Serialize, Deserialize)]
pub struct Source {
    name: String,
    url: String,
    path: PathBuf,
    nar_hash: String,
    kind: SourceKind,
}

impl Source {
    pub fn name(&self) -> &str {
        &self.name
    }

    pub fn url(&self) -> &str {
        &self.url
    }

    pub fn path(&self) -> &Path {
        &self.path
    }

    pub fn nar_hash(&self) -> &str {
        &self.nar_hash
    }

    pub fn kind(&self) -> &SourceKind {
        &self.kind
    }
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord, Serialize, Deserialize)]
pub enum SourceKind {
    Git { rev: String },
    UnpackedArchive,
    File,
}

impl Source {
    #[tracing::instrument]
    pub async fn fetch_url(name: &str, url: &str, unpack: bool) -> Result<Self> {
        debug!("fetching archive {}", url);
        let mut url = url.to_string();
        let parsed_url = Url::parse(&url)?;
        match parsed_url.host_str() {
            Some("github.com") => {
                let segments: Vec<_> = parsed_url
                    .path_segments()
                    .map(|s| s.collect())
                    .unwrap_or_default();
                if let [owner, repo, "archive", "refs", "heads", branch_archive] = segments[..] {
                    let branch_archive = branch_archive
                        .strip_suffix(".tar.gz")
                        .unwrap_or(branch_archive);
                    let branch = branch_archive
                        .strip_suffix(".zip")
                        .unwrap_or(branch_archive);
                    return Self::fetch_git(
                        name,
                        &format!("https://github.com/{owner}/{repo}.git"),
                        branch,
                    )
                    .await;
                }
            }
            Some("raw.githubusercontent.com") => {
                let segments: Vec<_> = parsed_url
                    .path_segments()
                    .map(|s| s.collect())
                    .unwrap_or_default();
                if let [owner, repo, branch_name, ref path @ ..] = segments[..] {
                    let config = octocrate::APIConfig::default().shared();
                    let api = octocrate::GitHubAPI::new(&config);
                    let resp = api.repos.get_branch(owner, repo, branch_name).send().await;
                    match resp {
                        Ok(branch) => {
                            let sha = branch.commit.sha;
                            url = format!(
                                "https://raw.githubusercontent.com/{owner}/{repo}/{sha}/{}",
                                path.join("/")
                            );
                        }
                        Err(err) => {
                            warn!(?err, "failed to get branch {}", branch_name);
                        }
                    }
                }
            }
            _ => {}
        }
        let child = if unpack {
            Command::new("nix-prefetch-url")
                .arg("--unpack")
                .arg("--print-path")
                .arg(&url)
                .stderr(Stdio::piped())
                .stdout(Stdio::piped())
                .stdin(Stdio::null())
                .spawn()?
        } else {
            Command::new("nix-prefetch-url")
                .arg("--print-path")
                .arg(&url)
                .stderr(Stdio::piped())
                .stdout(Stdio::piped())
                .stdin(Stdio::null())
                .spawn()?
        };
        let output = wait_and_get_output(child).await?;
        if !output.status.success() {
            bail!(
                "nix-prefetch-url failed: status: {}\nstdout:\n{}\nstderr:\n{}",
                output.status,
                String::from_utf8_lossy(&output.stdout),
                String::from_utf8_lossy(&output.stderr)
            );
        }
        let stdout = String::from_utf8(output.stdout)?;
        let mut lines = stdout.lines();
        let nix32_hash = lines.next().context("no output from nix-prefetch-url")?;
        let hash = parse_nix_base32(nix32_hash).context("failed to pares hash")?;
        let path = lines.next().context("no path from nix-prefetch-url")?;
        Ok(Source {
            name: name.to_string(),
            url: url.to_string(),
            path: path.into(),
            nar_hash: format!("sha256-{}", STANDARD.encode(hash)),
            kind: if unpack {
                SourceKind::UnpackedArchive
            } else {
                SourceKind::File
            },
        })
    }

    #[tracing::instrument]
    pub async fn fetch_git(name: &str, url: &str, rev_or_branch: &str) -> Result<Self> {
        #[derive(Debug, Deserialize)]
        struct Out {
            rev: String,
            path: PathBuf,
            hash: String,
        }
        let url = if url.starts_with("git://") {
            url.replacen("git://", "https://", 1)
        } else {
            url.to_string()
        };
        let rev_or_branch = rev_or_branch
            .strip_prefix("origin/")
            .unwrap_or(rev_or_branch);
        debug!("fetching git repository {} {}", url, rev_or_branch);
        let child = Command::new("nix-prefetch-git")
            .arg("--url")
            .arg(&url)
            .arg("--rev")
            .arg(rev_or_branch)
            .arg("--fetch-submodules")
            .stderr(Stdio::piped())
            .stdout(Stdio::piped())
            .stdin(Stdio::null())
            .spawn()?;
        let output = wait_and_get_output(child).await?;
        let out: Out = if output.status.success() {
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        } else {
            let child = Command::new("nix-prefetch-git")
                .arg("--url")
                .arg(&url)
                .arg("--rev")
                .arg("refs/heads/".to_string() + rev_or_branch)
                .arg("--fetch-submodules")
                .stderr(Stdio::piped())
                .stdout(Stdio::piped())
                .stdin(Stdio::null())
                .spawn()?;
            let output = wait_and_get_output(child).await?;
            ensure!(output.status.success());
            let stdout = String::from_utf8(output.stdout)?;
            serde_json::from_str(&stdout)?
        };
        info!(
            "git repository fetched '{url}' '{rev_or_branch}' into '{}'",
            out.path.to_string_lossy()
        );
        Ok(Source {
            name: name.to_string(),
            url: url.to_string(),
            path: out.path,
            nar_hash: out.hash,
            kind: SourceKind::Git { rev: out.rev },
        })
    }
}

async fn wait_and_get_output(mut child: Child) -> Result<Output> {
    let stderr = child.stderr.take().unwrap();
    let mut reader = BufReader::new(stderr);
    loop {
        let mut buf = Vec::new();
        select! {
            read_len = reader.read_buf(&mut buf) => {
                let read_len = read_len?;
                if read_len == 0 {
                    return Ok(child.wait_with_output().await?);
                }
            }
            _ = tokio::time::sleep(std::time::Duration::from_secs(360)) => {
                bail!("timeout")
            }
        }
    }
}

fn parse_nix_base32(s: &str) -> Option<Vec<u8>> {
    const BASE32_CHARS: &[u8] = b"0123456789abcdfghijklmnpqrsvwxyz";
    let s = s.as_bytes();
    let hash_size = s.len() * 5 / 8;
    let mut hash: Vec<u8> = vec![0; hash_size];

    for n in 0usize..s.len() {
        let c = s[s.len() - n - 1];
        let digit = BASE32_CHARS.iter().position(|b| *b == c)? as u8;
        let b = n * 5;
        let i = b / 8;
        let j = b % 8;
        hash[i] |= digit.checked_shl(j as u32).unwrap_or(0);

        let v2 = digit.checked_shr(8 - j as u32).unwrap_or(0);
        if i < hash_size - 1 {
            hash[i + 1] |= v2;
        } else if v2 != 0 {
            return None;
        }
    }

    Some(hash)
}

#[derive(Debug, Clone, Default)]
struct SourceCacheData {
    caches: BTreeMap<String, Arc<OnceCell<Result<Source, String>>>>,
}

impl SourceCacheData {
    fn load(path: &Path) -> Result<Self> {
        let file = File::open(path)?;
        let data: BTreeMap<String, Source> = serde_json::from_reader(file)?;
        let caches = data
            .into_iter()
            .map(|(k, v)| (k, Arc::new(OnceCell::from(Ok(v)))))
            .collect();
        Ok(SourceCacheData { caches })
    }

    fn save(&self, path: &Path) -> Result<()> {
        let file = File::create(path)?;
        let data: BTreeMap<String, Source> = self
            .caches
            .iter()
            .filter_map(|(k, v)| {
                if let Some(Ok(v)) = v.get() {
                    Some((k.clone(), v.clone()))
                } else {
                    None
                }
            })
            .collect();
        serde_json::to_writer_pretty(file, &data)?;
        Ok(())
    }
}

#[derive(Debug)]
pub struct Fetcher {
    path: PathBuf,
    cache: std::sync::Mutex<SourceCacheData>,
    semaphore: Semaphore,
    max_concurrent_downloads: usize,
}

impl Fetcher {
    pub fn new(cfg: &ConfigRef, name: &str) -> Self {
        let path = cfg.cache_dir.join(name.to_string() + "-source-cache.json");
        let cache = SourceCacheData::load(&path).unwrap_or_default();
        Self {
            path,
            cache: std::sync::Mutex::new(cache),
            semaphore: Semaphore::new(cfg.max_concurrent_downloads),
            max_concurrent_downloads: cfg.max_concurrent_downloads,
        }
    }

    pub fn new_arc(cfg: &ConfigRef, name: &str) -> Arc<Self> {
        Arc::new(Self::new(cfg, name))
    }

    pub async fn fetch_url(&self, name: &str, url: &str, unpack: bool) -> Result<Source> {
        let key = format!("url {url}{}", if unpack { " unpacked" } else { "" });
        let cell = self
            .cache
            .lock()
            .unwrap()
            .caches
            .entry(key)
            .or_default()
            .clone();
        let mut source = cell
            .get_or_init(|| async {
                let _permit = self.semaphore.acquire().await.unwrap();
                let source = Source::fetch_url(name, url, unpack)
                    .await
                    .with_context(|| format!("failed to fetch {url}"))
                    .map_err(|err| err.to_string())?;
                Ok(source)
            })
            .await
            .clone()
            .map_err(|e| anyhow!(e))?;
        source.name = name.to_string();
        Ok(source)
    }

    pub async fn fetch_git(&self, name: &str, url: &str, rev_or_branch: &str) -> Result<Source> {
        let key = format!("git {url} {rev_or_branch}");
        let cell = self
            .cache
            .lock()
            .unwrap()
            .caches
            .entry(key)
            .or_default()
            .clone();
        let mut source = cell
            .get_or_init(|| async {
                let _permit = self.semaphore.acquire().await.unwrap();
                let source = Source::fetch_git(name, url, rev_or_branch)
                    .await
                    .with_context(|| format!("failed to fetch git repository {url}"))
                    .map_err(|err| err.to_string())?;
                Ok(source)
            })
            .await
            .clone()
            .map_err(|e| anyhow!(e))?;
        source.name = name.to_string();
        Ok(source)
    }

    pub fn save(&self) -> Result<()> {
        let cache = self.cache.lock().unwrap();
        cache.save(&self.path)?;
        Ok(())
    }

    pub fn max_concurrent_downloads(&self) -> usize {
        self.max_concurrent_downloads
    }
}

impl Drop for Fetcher {
    fn drop(&mut self) {
        match self.save() {
            Ok(_) => {
                info!(
                    "source cache saved to {path}",
                    path = self.path.to_string_lossy()
                );
            }
            Err(err) => {
                warn!("failed to save source cache: {}", err);
            }
        }
    }
}

#[cfg(test)]
mod test {
    use tracing::level_filters::LevelFilter;

    use super::*;

    #[tokio::test]
    async fn test_fetch_git() {
        let _ = tracing_subscriber::fmt()
            .with_max_level(LevelFilter::DEBUG)
            .try_init();
        let url = "https://github.com/ros2-gbp/acado_vendor-release.git";
        Source::fetch_git("acado_vendor", url, "master")
            .await
            .unwrap();
        Source::fetch_git("acado_vendor", url, "release/jazzy/acado_vendor/1.0.0-7")
            .await
            .unwrap();
        Source::fetch_git("acado_vendor", url, "aaaaaaaa")
            .await
            .unwrap_err();
    }
}
