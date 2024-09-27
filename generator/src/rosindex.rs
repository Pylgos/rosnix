use std::{
    collections::{BTreeMap, BTreeSet},
    fmt::{Debug, Display},
    fs::File,
    io::{Read, Write},
};

use anyhow::{Context, Result};
use reqwest::{IntoUrl, Url};
use serde_roxmltree::Options;
use tracing::{debug, info, info_span};
use yaml_rust2::YamlLoader;

use crate::{condition::eval_condition, config::ConfigRef};

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
    pub manifests: BTreeMap<String, PackageManifest>,
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
pub struct PackageManifest {
    pub name: String,
    pub release_version: String,
    pub description: String,
    pub repository: String,
    pub tag: String,
    pub dependencies: RosDependencies,
    pub member_of_group: BTreeSet<String>,
}

#[derive(Debug, Copy, Clone, PartialEq, Eq, Hash, PartialOrd, Ord)]
pub enum RosDependencyKind {
    Build,
    BuildExport,
    Buildtool,
    BuildtoolExport,
    Exec,
    Test,
}

impl RosDependencyKind {
    pub fn is_buildtool(&self) -> bool {
        [
            RosDependencyKind::Buildtool,
            RosDependencyKind::BuildtoolExport,
        ]
        .contains(self)
    }

    pub fn is_runtime(&self) -> bool {
        [
            RosDependencyKind::Build,
            RosDependencyKind::BuildExport,
            RosDependencyKind::Exec,
        ]
        .contains(self)
    }
}

#[derive(Debug, Clone, Hash, PartialEq, Eq, PartialOrd, Ord)]
pub struct RosDependency {
    pub name: String,
    pub kind: RosDependencyKind,
}

#[derive(Debug, Clone)]
pub struct RosDependencies {
    pub deps: BTreeSet<RosDependency>,
    pub group_deps: BTreeSet<String>,
}

#[tracing::instrument(skip(cfg), fields(url = %url))]
async fn fetch_file_cached(cfg: &ConfigRef, url: impl IntoUrl + Display) -> Result<Vec<u8>> {
    let url = url.into_url().unwrap();
    let cache_path = cfg
        .cache_dir
        .join(url.path_segments().unwrap().last().unwrap());
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
        let url = "https://raw.githubusercontent.com/ros/rosdistro/master/index-v4.yaml";
        let content = String::from_utf8(fetch_file_cached(cfg, url).await?)?;

        let docs = YamlLoader::load_from_str(&content)?;
        let doc = &docs[0];

        let mut distros = BTreeMap::new();

        for name in cfg.distributions.iter() {
            let distro = &doc["distributions"][name.as_str()];
            let span = info_span!("parse distro", distro = %name);
            let _enter = span.enter();
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

            let mut env = cfg.env.get(name).cloned().unwrap_or_default();
            match ros_version {
                RosVersion::Ros1 => {
                    env.insert("ROS_VERSION".to_string(), "1".to_string());
                    env.insert("ros_version".to_string(), "1".to_string());
                }
                RosVersion::Ros2 => {
                    env.insert("ROS_VERSION".to_string(), "2".to_string());
                    env.insert("ros_version".to_string(), "2".to_string());
                }
            }
            match python_version {
                PythonVersion::Python2 => {
                    env.insert("ROS_PYTHON_VERSION".to_string(), "2".to_string());
                }
                PythonVersion::Python3 => {
                    env.insert("ROS_PYTHON_VERSION".to_string(), "3".to_string());
                }
            }
            env.insert("ROS_DISTRO".to_string(), name.clone());
            let manifests = fetch_package_manifests(cfg, &cache, &env).await?;

            distros.insert(
                name.clone(),
                PackageIndex {
                    name: name.clone(),
                    status,
                    cache_url: cache,
                    ros_version,
                    python_version,
                    manifests,
                },
            );
        }

        Ok(DistroIndex { distros })
    }
}

#[tracing::instrument(skip(cfg, env), fields(url = %url))]
async fn fetch_package_manifests(
    cfg: &ConfigRef,
    url: &Url,
    env: &BTreeMap<String, String>,
) -> Result<BTreeMap<String, PackageManifest>> {
    info!("fetching package manifest from {url}");
    let content = fetch_file_cached(cfg, url.clone()).await?;
    let mut decoder = flate2::read::GzDecoder::new(&content[..]);
    let mut buf = String::new();
    decoder.read_to_string(&mut buf)?;
    parse_distro_packages(cfg, &buf, env)
}

fn parse_distro_packages(
    cfg: &ConfigRef,
    data: &str,
    env: &BTreeMap<String, String>,
) -> Result<BTreeMap<String, PackageManifest>> {
    let docs = YamlLoader::load_from_str(data)?;
    let doc = &docs[0];
    let distro = &doc["distribution_file"][0];
    let mut packages = BTreeMap::new();
    for (repo_name, repo) in distro["repositories"].as_hash().unwrap() {
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
            let span = tracing::debug_span!("parse package", package_name);
            let _enter = span.enter();
            let tag = tag_template
                .replace("{version}", version)
                .replace("{package}", package_name);
            let package_xml_str = doc["release_package_xmls"][package_name].as_str().unwrap();
            let (description, member_of_group, dependencies) =
                parse_package_xml(cfg, package_xml_str, env)
                    .context(format!("failed to parse package.xml of {package_name}"))?;
            let manifest = PackageManifest {
                name: package_name.to_string(),
                release_version: version.to_string(),
                description,
                repository: url.to_string(),
                tag,
                dependencies,
                member_of_group,
            };
            packages.insert(package_name.to_string(), manifest);
        }
    }
    Ok(packages)
}

fn parse_package_xml(
    _cfg: &ConfigRef,
    xml_str: &str,
    env: &BTreeMap<String, String>,
) -> Result<(String, BTreeSet<String>, RosDependencies)> {
    #[derive(Debug, serde::Deserialize)]
    struct Doc {
        #[serde(default)]
        description: String,
        #[serde(default)]
        build_depend: Vec<Dep>,
        #[serde(default)]
        build_export_depend: Vec<Dep>,
        #[serde(default)]
        buildtool_depend: Vec<Dep>,
        #[serde(default)]
        buildtool_export_depend: Vec<Dep>,
        #[serde(default)]
        exec_depend: Vec<Dep>,
        #[serde(default)]
        test_depend: Vec<Dep>,
        #[serde(default)]
        depend: Vec<Dep>,
        #[serde(default)]
        group_depend: Vec<Dep>,
        #[serde(default)]
        member_of_group: Vec<String>,
    }

    #[derive(Debug, serde::Deserialize)]
    struct Dep {
        #[serde(rename = "@condition")]
        condition: Option<String>,
        #[serde(rename = "$text")]
        name: String,
    }

    let check_condition = |dep: &Dep| -> bool {
        if let Some(cond) = &dep.condition {
            eval_condition(cond, env).unwrap()
        } else {
            true
        }
    };

    let xml_doc = roxmltree::Document::parse(xml_str)?;
    let doc: Doc = serde_roxmltree::defaults()
        .prefix_attr()
        .from_doc(&xml_doc)?;

    let deps = [
        (RosDependencyKind::Build, &doc.build_depend),
        (RosDependencyKind::BuildExport, &doc.build_export_depend),
        (RosDependencyKind::Buildtool, &doc.buildtool_depend),
        (
            RosDependencyKind::BuildtoolExport,
            &doc.buildtool_export_depend,
        ),
        (RosDependencyKind::Exec, &doc.exec_depend),
        (RosDependencyKind::Test, &doc.test_depend),
        (RosDependencyKind::Build, &doc.depend),
        (RosDependencyKind::BuildExport, &doc.depend),
        (RosDependencyKind::Exec, &doc.depend),
    ]
    .into_iter()
    .flat_map(|(kind, deps)| {
        deps.iter()
            .filter(|dep| check_condition(dep))
            .map(move |dep| RosDependency {
                name: dep.name.clone(),
                kind,
            })
    })
    .collect();

    let group_deps = doc
        .group_depend
        .iter()
        .filter(|dep| check_condition(dep))
        .map(|d| d.name.clone())
        .collect();
    let ros_deps = RosDependencies { deps, group_deps };

    Ok((
        doc.description,
        doc.member_of_group.into_iter().collect(),
        ros_deps,
    ))
}

#[cfg(test)]
mod test {
    use tracing::level_filters::LevelFilter;

    use super::*;
    use crate::config::Config;

    #[tokio::test]
    async fn test_fetch_distro_index() {
        let _ = tracing_subscriber::fmt()
            .with_max_level(LevelFilter::DEBUG)
            .try_init();
        let cfg = Config::default().into_ref();
        cfg.create_directories().unwrap();
        let _index = DistroIndex::fetch(&cfg).await.unwrap();
    }
}
