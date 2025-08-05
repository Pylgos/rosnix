use core::str;
use std::{
    collections::BTreeMap,
    fmt::{Debug, Display},
    fs::File,
    io::{Read, Write},
};

use anyhow::Result;
use reqwest::{IntoUrl, Url};
use tracing::{debug, info, info_span};
use yaml_rust2::YamlLoader;

use crate::config::ConfigRef;

#[derive(Debug, Clone)]
pub struct DistroIndex {
    pub distros: BTreeMap<String, PackageIndex>,
}

#[derive(Debug, Clone)]
pub struct PackageIndex {
    pub name: String,
    pub status: DistroStatus,
    pub cache_url: Url,
    pub ros_version: RosVersion,
    pub python_version: PythonVersion,
    pub releases: BTreeMap<String, PackageRelease>,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum DistroStatus {
    Active,
    EndOfLife,
    Rolling,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum RosVersion {
    Ros1,
    Ros2,
}

#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum PythonVersion {
    Python2,
    Python3,
}

#[derive(Debug, Clone)]
pub struct PackageRelease {
    pub release_version: String,
    pub repository: String,
    pub tag: String,
}

#[tracing::instrument(skip(cfg), fields(url = %url))]
async fn fetch_file_cached(cfg: &ConfigRef, url: impl IntoUrl + Display) -> Result<Vec<u8>> {
    let url = url.into_url().unwrap();
    let mangled_url = url.to_string().replace("/", "@");
    let cache_path = cfg.cache_dir.join(mangled_url);
    if cache_path.exists() {
        debug!("cache hit {url}");
        let mut file = File::open(cache_path)?;
        let mut buf = Vec::new();
        file.read_to_end(&mut buf)?;
        return Ok(buf);
    }

    debug!("downloading {url}");
    let response = reqwest::get(url.clone()).await?.error_for_status()?;
    let bytes = response.bytes().await?;
    let mut file = File::create(cache_path)?;
    file.write_all(&bytes)?;
    Ok(bytes.to_vec())
}

impl DistroIndex {
    #[tracing::instrument(skip(cfg))]
    pub async fn fetch(cfg: &ConfigRef) -> Result<Self> {
        let repo_url = Url::parse("https://raw.githubusercontent.com/ros/rosdistro/").unwrap();
        let base_url = repo_url.join(&format!("{}/", cfg.index_rev)).unwrap();
        info!("fetching distro index from {base_url}");
        let index_url = base_url.join("index-v4.yaml").unwrap();
        let content = String::from_utf8(fetch_file_cached(cfg, index_url).await?)?;

        let docs = YamlLoader::load_from_str(&content)?;
        let doc = &docs[0];

        let mut distros = BTreeMap::new();

        for name in cfg.distributions.iter() {
            let distro = &doc["distributions"][name.as_str()];
            let span = info_span!("parse distro", distro = %name);
            let _enter = span.enter();
            let distro_yaml_paths = distro["distribution"]
                .as_vec()
                .unwrap()
                .iter()
                .map(|rel_path| rel_path.as_str().unwrap());
            let status = match distro["distribution_status"].as_str().unwrap() {
                "active" => DistroStatus::Active,
                "end-of-life" => DistroStatus::EndOfLife,
                "rolling" => DistroStatus::Rolling,
                _ => unimplemented!(),
            };
            let cache = Url::parse(distro["distribution_cache"].as_str().unwrap()).unwrap();
            let ros_version = match distro["distribution_type"].as_str().unwrap() {
                "ros1" => RosVersion::Ros1,
                "ros2" => RosVersion::Ros2,
                _ => unimplemented!(),
            };
            let python_version = match distro["python_version"].as_i64().unwrap() {
                2 => PythonVersion::Python2,
                3 => PythonVersion::Python3,
                _ => unimplemented!(),
            };

            let mut releases = BTreeMap::new();
            for rel_yaml_path in distro_yaml_paths {
                let url = base_url.join(rel_yaml_path).unwrap();
                collect_releases(&mut releases, cfg, &url).await?;
            }

            distros.insert(
                name.clone(),
                PackageIndex {
                    name: name.clone(),
                    status,
                    cache_url: cache,
                    ros_version,
                    python_version,
                    releases,
                },
            );
        }

        Ok(DistroIndex { distros })
    }
}

#[tracing::instrument(skip(cfg), fields(url = %url))]
async fn collect_releases(
    releases: &mut BTreeMap<String, PackageRelease>,
    cfg: &ConfigRef,
    url: &Url,
) -> Result<()> {
    info!("fetching package releases from {url}");
    let content = fetch_file_cached(cfg, url.clone()).await?;
    parse_distro_releases(releases, str::from_utf8(&content)?)
}

fn parse_distro_releases(
    releases: &mut BTreeMap<String, PackageRelease>,
    data: &str,
) -> Result<()> {
    let docs = YamlLoader::load_from_str(data)?;
    for (repo_name, repo) in docs[0]["repositories"].as_hash().unwrap() {
        let repo_name = repo_name.as_str().unwrap();
        let release = &repo["release"];
        let tag_template = &release["tags"]["release"];
        let url = &release["url"];
        let version = &release["version"];
        if release.is_badvalue()
            || tag_template.is_badvalue()
            || url.is_badvalue()
            || version.is_badvalue()
        {
            continue;
        }
        let tag_template = tag_template.as_str().unwrap();
        let url = url.as_str().unwrap();
        let version = version.as_str().unwrap();
        let repo_packages = if release["packages"].is_badvalue() {
            vec![repo_name]
        } else {
            release["packages"]
                .as_vec()
                .unwrap()
                .iter()
                .map(|s| s.as_str().unwrap())
                .collect()
        };
        for package_name in repo_packages.into_iter() {
            let span = tracing::info_span!("parse package", package_name);
            let _enter = span.enter();
            let tag = tag_template
                .replace("{version}", version)
                .replace("{package}", package_name);
            let release = PackageRelease {
                release_version: version.to_string(),
                repository: url.to_string(),
                tag,
            };
            releases.insert(package_name.to_string(), release);
        }
    }
    Ok(())
}
