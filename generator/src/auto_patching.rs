use std::{
    collections::{BTreeSet, HashMap, HashSet},
    fs,
    io::Read,
    os::unix::fs::PermissionsExt,
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::{bail, Context, Result};
use reqwest::Url;
use tracing::{info, warn};
use walkdir::WalkDir;

use crate::{
    cmake::{cmake_find_calls, CMakeArgs},
    config::ConfigRef,
    hunter::Hunter,
    source::{Fetcher, Source},
};

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct PatchedSource {
    pub local_name: Option<String>,
    pub source: Source,
    pub substitutions: Vec<Substitution>,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub struct Substitution {
    pub path: PathBuf,
    pub from: String,
    pub with: Replacement,
}

#[derive(Debug, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum Replacement {
    Path(PatchedSource),
    Url(PatchedSource),
    Download(PatchedSource),
    Literal(String),
    Prefixed(String, PatchedSource),
    Shebang(String, String),
}

impl Substitution {
    fn patched_source(&self) -> Option<&PatchedSource> {
        match &self.with {
            Replacement::Path(src)
            | Replacement::Url(src)
            | Replacement::Download(src)
            | Replacement::Prefixed(_, src) => Some(src),
            _ => None,
        }
    }

    fn patched_source_mut(&mut self) -> Option<&mut PatchedSource> {
        match &mut self.with {
            Replacement::Path(src)
            | Replacement::Url(src)
            | Replacement::Download(src)
            | Replacement::Prefixed(_, src) => Some(src),
            _ => None,
        }
    }
}

impl PatchedSource {
    pub fn local_name(&self) -> &str {
        self.local_name.as_ref().unwrap()
    }

    fn new(source: Source, substitutions: BTreeSet<Substitution>) -> Self {
        Self {
            local_name: None,
            source,
            substitutions: substitutions.into_iter().collect(),
        }
    }

    fn set_local_names(&mut self, is_root: bool) {
        // Set local name for root source
        if is_root {
            self.local_name = Some(self.source.name().to_string())
        }

        // Create a HashMap to store the count of each source name
        let mut name_counts = HashMap::new();
        for subst in self.substitutions.iter() {
            if let Some(src) = subst.patched_source() {
                let name = src.source.name().to_string();
                *name_counts.entry(name).or_insert(0) += 1;
            }
        }

        // Create a HashMap to store the current count of each source name
        let mut name_counter: HashMap<_, _> =
            name_counts.keys().map(|name| (name.clone(), 0)).collect();

        for subst in self.substitutions.iter_mut() {
            if let Some(src) = subst.patched_source_mut() {
                let name = src.source.name().to_string();
                let total = name_counts[&name];
                let count = name_counter.get_mut(&name).unwrap();
                *count += 1;

                // If the source name is not unique, append the count to it
                let local_name = if total > 1 {
                    format!("{name}-{count}")
                } else {
                    name
                };

                // If a parent name is provided, prepend it to the local name
                src.local_name = Some(format!(
                    "{}/{}",
                    self.local_name.as_ref().unwrap(),
                    local_name
                ));
            }
        }

        // Set the local names for all substitutions
        for subst in self.substitutions.iter_mut() {
            if let Some(src) = subst.patched_source_mut() {
                src.set_local_names(false);
            }
        }
    }
}

fn guess_name_from_url(url: &str) -> Option<String> {
    let url = Url::parse(url).ok()?;
    let path = url.path_segments()?.last()?;
    let name = path.split('.').next()?;
    if name.is_empty() {
        return None;
    }
    Some(name.to_string())
}

fn get_vendor_source_name(url: &str) -> String {
    guess_name_from_url(url).unwrap_or("unknown".to_string())
}

async fn fetch_url(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    url: &str,
    unpack: bool,
) -> Result<Source> {
    if cfg
        .auto_patching
        .ignore_urls
        .iter()
        .any(|re| re.is_match(url))
    {
        bail!("ignored url {url}");
    }
    fetcher
        .fetch_url(&get_vendor_source_name(url), url, unpack)
        .await
}

async fn fetch_git(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    url: &str,
    tag: &str,
) -> Result<Source> {
    if cfg
        .auto_patching
        .ignore_urls
        .iter()
        .any(|re| re.is_match(url))
    {
        bail!("ignored url {url}");
    }
    fetcher
        .fetch_git(&get_vendor_source_name(url), url, tag)
        .await
}

struct PatchState {
    patched: HashMap<Source, PatchedSource>,
    hunter: Option<Hunter>,
}

fn read_file_loosey(path: &Path) -> Result<String> {
    let mut f = fs::File::open(path)?;
    let mut buf = Vec::new();
    let n = f.read_to_end(&mut buf)?;
    Ok(String::from_utf8_lossy(&buf[0..n]).to_string())
}

fn patch_shebangs(dir: &Path) -> Result<BTreeSet<Substitution>> {
    let mut substitutions = BTreeSet::new();
    for file in WalkDir::new(dir) {
        let file = file?;
        if file.file_type().is_dir() {
            continue;
        }
        let metadata = file.metadata()?;
        let is_executable = metadata.permissions().mode() & 0o111 != 0;
        if !is_executable {
            continue;
        }
        let rel_path = file.path().strip_prefix(dir)?;
        let filename = file.file_name();
        if filename == "Configure" {
            let mut f = fs::File::open(file.path())?;
            let mut buf = vec![0; 1000];
            let read_len = f.read(&mut buf)?;
            let buf = &buf[..read_len];
            if !buf.starts_with(b"#!") {
                continue;
            }
            let Some(lf_pos) = buf.iter().position(|&c| c == b'\n') else {
                continue;
            };
            let shebang = String::from_utf8_lossy(&buf[2..lf_pos]);
            let parts: Vec<&str> = shebang.split_whitespace().collect();
            if parts.first() == Some(&"/usr/bin/env") {
                let Some(program) = parts.get(1) else {
                    continue;
                };
                let (package, program) = match *program {
                    "perl" => ("perl", "perl"),
                    _ => {
                        continue;
                    }
                };
                info!(path = %file.path().display(), %shebang, %package, %program, "found shebang");
                let subst = Substitution {
                    path: rel_path.to_path_buf(),
                    from: "#!".to_string() + &shebang,
                    with: Replacement::Shebang(package.into(), program.into()),
                };
                substitutions.insert(subst);
            }
        }
    }
    Ok(substitutions)
}

fn collect_cmake_calls<'a>(
    cfg: &ConfigRef,
    dir: &Path,
    func_names: impl IntoIterator<Item = &'a str>,
) -> Result<HashMap<String, Vec<(PathBuf, CMakeArgs)>>> {
    let func_names: HashSet<&str> = func_names.into_iter().collect();
    let mut result: HashMap<_, _> = func_names
        .iter()
        .map(|&f| (f.to_string(), Vec::new()))
        .collect();
    let mut entries = WalkDir::new(dir)
        .into_iter()
        .collect::<Result<Vec<_>, _>>()?;
    entries.sort_by_cached_key(|entry| entry.path().to_path_buf());
    for file in entries {
        if file.file_type().is_dir() {
            continue;
        }
        let rel_path = file.path().strip_prefix(dir)?;
        let rel_path_str = rel_path.to_string_lossy().to_ascii_lowercase();
        let ignore = cfg
            .auto_patching
            .ignore_files
            .iter()
            .any(|re| re.is_match(&rel_path_str));
        if ignore {
            continue;
        }
        let filename = file.file_name().to_string_lossy();
        if filename == "CMakeLists.txt"
            || filename.ends_with(".cmake")
            || filename.ends_with(".cmake.in")
        {
            let content = match read_file_loosey(file.path()) {
                Ok(content) => content,
                Err(err) => {
                    warn!(path = %file.path().display(), %err, "failed to read cmake file");
                    continue;
                }
            };
            let calls = cmake_find_calls(&content);
            let mut vars = HashMap::new();
            for call in calls {
                let func = call.func.to_ascii_lowercase();
                if func_names.contains(func.as_str()) {
                    let args = CMakeArgs::parse(&call.args, &vars);
                    result
                        .get_mut(&func)
                        .unwrap()
                        .push((rel_path.to_path_buf(), args));
                }
                if func == "set" {
                    let args = CMakeArgs::parse(&call.args, &vars);
                    if let (Some(key), Some(value)) = (args.get(0), args.get(1)) {
                        vars.insert(key.into(), value.into());
                    };
                }
            }
        }
    }
    Ok(result)
}

#[tracing::instrument(skip(cfg, fetcher), fields(src = %src.name()))]
pub async fn auto_patch_source(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    src: &Source,
) -> Result<PatchedSource> {
    let mut state = PatchState {
        patched: HashMap::new(),
        hunter: None,
    };
    let mut patched_source = auto_patch_source_impl(cfg, fetcher, src, &mut state)
        .await
        .with_context(|| format!("failed to auto_patch source {src:?}"))?;
    patched_source.set_local_names(true);
    Ok(patched_source)
}

async fn auto_patch_source_impl(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    src: &Source,
    state: &mut PatchState,
) -> Result<PatchedSource> {
    match auto_patch_source_inner(cfg, fetcher, src, state).await {
        Ok(patched) => Ok(patched),
        Err(err) => {
            warn!(src = %src.name(), %err, "failed to auto_patch source");
            Err(err)
        }
    }
}

#[async_recursion::async_recursion]
async fn auto_patch_source_inner(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    src: &Source,
    state: &mut PatchState,
) -> Result<PatchedSource> {
    if let Some(patched) = state.patched.get(src) {
        return Ok(patched.clone());
    }

    let mut cmake_calls = collect_cmake_calls(
        cfg,
        src.path(),
        [
            "externalproject_add",
            "fetchcontent_declare",
            "ament_vendor",
            "file",
            "huntergate",
            "hunter_config",
            "hunter_add_package",
        ],
    )?;

    let read_rel_path = |rel_path: &Path| read_file_loosey(&src.path().join(rel_path));

    let mut hunter_gate_url: Option<(PathBuf, String)> = None;
    if state.hunter.is_none() {
        cmake_calls
            .get_mut("huntergate")
            .unwrap()
            .sort_by_cached_key(|(path, _args)| path.clone());
        let call = cmake_calls["huntergate"].first();
        if let Some((rel_path, args)) = call {
            let content = read_rel_path(rel_path)?;
            info!("huntergate: {:} {:?}", rel_path.display(), args);
            let url = args.find_keyword_arg_expect_url("URL");
            if let Some(url) = url {
                let from = content[url.range].to_string();
                if let Ok(source) = fetch_url(cfg, fetcher, &url.value, true).await {
                    state.hunter = Some(Hunter::new(&source)?);
                    hunter_gate_url = Some((rel_path.clone(), from));
                };
            }
        }
    }

    let mut substitutions = BTreeSet::new();

    for (rel_path, args) in cmake_calls["hunter_config"].iter() {
        let content = read_rel_path(rel_path)?;
        let name = args.get(0);
        let version = args.find_keyword_arg("VERSION");
        let url = args.find_keyword_arg_expect_url("URL");
        if let Some((name, version)) = name.zip(version) {
            if let Some(hunter) = state.hunter.as_mut() {
                hunter.config(
                    name,
                    &version.value,
                    url.as_ref().map(|arg| arg.value.as_str()),
                )?;
            }
            if let Some(url) = url {
                let from = content[url.range].to_string();
                let Ok(source) = fetch_url(cfg, fetcher, &url.value, true).await else {
                    continue;
                };
                let patched = auto_patch_source_impl(cfg, fetcher, &source, state).await?;
                substitutions.insert(Substitution {
                    path: rel_path.to_path_buf(),
                    from,
                    with: Replacement::Url(patched),
                });
            }
        }
    }

    for (_rel_path, args) in cmake_calls["hunter_add_package"].iter() {
        let name = args.get(0);
        if let Some(name) = name {
            if let Some(hunter) = state.hunter.as_mut() {
                hunter.add_package(name);
            }
        }
    }

    for (rel_path, args) in cmake_calls["externalproject_add"]
        .iter()
        .chain(cmake_calls["fetchcontent_declare"].iter())
    {
        let content = read_rel_path(rel_path)?;
        let git_repo = args.find_keyword_arg_expect_url("GIT_REPOSITORY");
        let git_tag = args.find_keyword_arg("GIT_TAG");
        let url = args.find_keyword_arg_expect_url("URL");
        if let Some((repo, tag)) = git_repo.zip(git_tag) {
            let from = content[repo.range].to_string();
            let Ok(source) = fetch_git(cfg, fetcher, &repo.value, &tag.value).await else {
                continue;
            };
            let patched = auto_patch_source_impl(cfg, fetcher, &source, state).await?;
            substitutions.insert(Substitution {
                path: rel_path.to_path_buf(),
                from,
                with: Replacement::Url(patched),
            });
        } else if let Some(url) = url {
            let from = content[url.range].to_string();
            let Ok(source) = fetch_url(cfg, fetcher, &url.value, true).await else {
                continue;
            };
            let patched = auto_patch_source_impl(cfg, fetcher, &source, state).await?;
            substitutions.insert(Substitution {
                path: rel_path.to_path_buf(),
                from,
                with: Replacement::Url(patched),
            });
        }
    }

    for (rel_path, args) in cmake_calls["ament_vendor"].iter() {
        let content = read_rel_path(rel_path)?;
        let vcs_type = args.find_keyword_arg("VCS_TYPE");
        let vcs_url = args.find_keyword_arg_expect_url("VCS_URL");
        let vcs_version = args.find_keyword_arg("VCS_VERSION");

        if let Some((vcs_url, vcs_version)) = vcs_url.zip(vcs_version) {
            let from = content[vcs_url.range.clone()].to_string();
            let Ok(source) = (match vcs_type.as_ref().map(|arg| arg.value.as_str()) {
                Some("git") | None => {
                    fetch_git(cfg, fetcher, &vcs_url.value, &vcs_version.value).await
                }
                Some("zip") => fetch_url(cfg, fetcher, &vcs_url.value, true).await,
                Some(ty) => {
                    bail!("unsupported VCS_TYPE {ty}");
                }
            }) else {
                continue;
            };
            let patched = auto_patch_source_impl(cfg, fetcher, &source, state).await?;
            substitutions.insert(Substitution {
                path: rel_path.to_path_buf(),
                from,
                with: Replacement::Path(patched),
            });
            // Remove VCS_TYPE if exists
            if let Some(vcs_type) = &vcs_type {
                let from = content[vcs_type.range.clone()].to_string();
                substitutions.insert(Substitution {
                    path: rel_path.to_path_buf(),
                    from,
                    with: Replacement::Literal("".into()),
                });
            }
        }
    }

    for (rel_path, args) in cmake_calls["file"].iter() {
        let content = read_rel_path(rel_path)?;
        let url = args.find_keyword_arg_expect_url("DOWNLOAD");
        if let Some(url) = url {
            let from = content[url.range].to_string();
            let Ok(source) = fetch_url(cfg, fetcher, &url.value, false).await else {
                continue;
            };
            substitutions.insert(Substitution {
                path: rel_path.to_path_buf(),
                from,
                with: Replacement::Download(PatchedSource::new(source, BTreeSet::new())),
            });
        }
    }

    if let Some((rel_path, url_arg)) = hunter_gate_url {
        let mut hunter_subst = BTreeSet::new();
        let mut prev_added_packages = BTreeSet::new();
        loop {
            let added_packages = state.hunter.as_ref().unwrap().added_packages().clone();
            if added_packages == prev_added_packages {
                break;
            }
            let diff: Vec<_> = added_packages
                .difference(&prev_added_packages)
                .cloned()
                .collect();
            prev_added_packages = added_packages;
            for name in diff {
                let Some(pkg) = state
                    .hunter
                    .as_ref()
                    .unwrap()
                    .packages()
                    .get(&name)
                    .cloned()
                else {
                    continue;
                };
                for version in pkg.used_versions.iter() {
                    info!("hunter package: {} {}", name, version);
                    let Some((rel_path, url_arg)) =
                        &pkg.versions.get(version).and_then(|s| s.url_arg.as_ref())
                    else {
                        continue;
                    };
                    let Ok(source) = state
                        .hunter
                        .as_ref()
                        .unwrap()
                        .fetch_package(&name, version, fetcher)
                        .await
                    else {
                        continue;
                    };
                    let patched = auto_patch_source_impl(cfg, fetcher, &source, state).await?;
                    let subst = Substitution {
                        path: rel_path.clone(),
                        from: url_arg.clone(),
                        with: Replacement::Url(patched),
                    };
                    hunter_subst.insert(subst);
                }
            }
            // PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin is hardcoded in this script :(
            hunter_subst.insert(Substitution {
                path: "cmake/projects/OpenSSL/schemes/url_sha1_openssl.cmake.in".into(),
                from: r#". "@HUNTER_GLOBAL_SCRIPT_DIR@/clear-all.sh" && "#.into(),
                with: Replacement::Literal("".into()),
            });
        }
        let patched_hunter = PatchedSource::new(
            state.hunter.as_ref().unwrap().source().clone(),
            hunter_subst,
        );
        substitutions.insert(Substitution {
            path: rel_path,
            from: url_arg,
            with: Replacement::Url(patched_hunter),
        });
    }

    substitutions.extend(patch_shebangs(src.path())?);

    let patched = PatchedSource::new(src.clone(), substitutions);

    state.patched.insert(src.clone(), patched.clone());

    Ok(patched)
}

#[cfg(test)]
mod test {
    use super::*;

    #[test]
    fn test_cmake_tokenize() {
        let src = r#"cmake_minimum_required(VERSION 3.6)
project(pybind11-json-download NONE)

include(ExternalProject)
ExternalProject_Add(
    pybind11_json
    PREFIX .
    GIT_REPOSITORY "https://github.com/pybind/pybind11_json.git"
    GIT_TAG        0.2.13
    GIT_CONFIG     advice.detachedHead=false  # otherwise we'll get "You are in 'detached HEAD' state..."
    SOURCE_DIR     "${CMAKE_BINARY_DIR}/third-party/pybind11-json"
    GIT_SHALLOW    ON        # No history needed (requires cmake 3.6)
    # Override default steps with no action, we just want the clone step.
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    )"#;
        let calls = cmake_find_calls(src);
        for call in calls {
            println!("{:?}", call);
        }
    }
}
