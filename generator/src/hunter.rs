use std::{
    collections::{BTreeSet, HashMap},
    path::{Path, PathBuf},
};

use anyhow::{bail, Result};
use tracing::info;
use walkdir::WalkDir;

use crate::{
    cmake::{cmake_find_calls, CMakeArgs},
    source::{Fetcher, Source},
};

#[derive(Debug, Clone)]
pub struct HunterSourceInfo {
    pub url: String,
    pub url_arg: Option<(PathBuf, String)>,
}

#[derive(Debug, Clone, Default)]
pub struct HunterPackageInfo {
    pub used_versions: BTreeSet<String>,
    pub versions: HashMap<String, HunterSourceInfo>,
}

pub struct Hunter {
    source: Source,
    packages: HashMap<String, HunterPackageInfo>,
    added_packages: BTreeSet<String>,
}

impl Hunter {
    pub fn new(source: &Source) -> Result<Self> {
        info!("hunter source: {:?}", source.path());
        let packages = find_packages(source.path())?;
        Ok(Self {
            source: source.clone(),
            packages,
            added_packages: BTreeSet::new(),
        })
    }

    pub fn config(&mut self, name: &str, version: &str, url: Option<&str>) -> Result<()> {
        info!("hunter config: {} {} {:?}", name, version, url);
        let pkg = self.packages.entry(name.to_string()).or_default();
        if let Some(url) = url {
            // if pkg.versions.contains_key(version) {
            //     bail!("hunter package already exists: {} {}", name, version);
            // }
            let info = HunterSourceInfo {
                url: url.to_string(),
                url_arg: None,
            };
            pkg.versions.insert(version.to_string(), info);
        }
        pkg.used_versions.insert(version.to_string());
        Ok(())
    }

    pub fn add_package(&mut self, name: &str) {
        self.added_packages.insert(name.to_string());
    }

    pub fn source(&self) -> &Source {
        &self.source
    }

    pub fn packages(&self) -> &HashMap<String, HunterPackageInfo> {
        &self.packages
    }

    pub fn added_packages(&self) -> &BTreeSet<String> {
        &self.added_packages
    }

    pub async fn fetch_package(
        &self,
        name: &str,
        version: &str,
        fetcher: &Fetcher,
    ) -> Result<Source> {
        if let Some(info) = self
            .packages
            .get(name)
            .and_then(|v| v.versions.get(version))
        {
            let src_name = format!("hunter-{}-{}", name, version).replace(".", "_");
            fetcher.fetch_url(&src_name, &info.url, true).await
        } else {
            let base = format!(
                "hunter package not found: {} {}\n hunter: {:?}",
                name, version, self.source
            );
            if let Some(info) = self.packages.get(name) {
                bail!("{} available versions: {:?}", base, info.versions.keys());
            } else {
                bail!("{}", base);
            }
        }
    }
}

fn find_packages(path: &Path) -> Result<HashMap<String, HunterPackageInfo>> {
    let mut packages: HashMap<String, HunterPackageInfo> = HashMap::new();
    for file in WalkDir::new(path) {
        let file = file?;
        if file.file_type().is_dir() {
            continue;
        }
        let rel_path = file.path().strip_prefix(path)?;
        let filename = file.file_name().to_string_lossy();
        if filename.ends_with(".cmake") {
            let content = std::fs::read_to_string(file.path())?;
            let calls = cmake_find_calls(&content);
            let mut vars = HashMap::new();
            for call in calls {
                let args = CMakeArgs::parse(&call.args, &vars);
                match call.func.to_ascii_lowercase().as_str() {
                    "set" => {
                        let (Some(key), Some(value)) = (args.get(0), args.get(1)) else {
                            continue;
                        };
                        vars.insert(key.into(), value.into());
                    }
                    "hunter_add_version" => {
                        let name = args.find_keyword_arg("PACKAGE_NAME");
                        let version = args.find_keyword_arg("VERSION");
                        let url = args.find_keyword_arg("URL");
                        if let (Some(name), Some(version), Some(url)) = (name, version, url) {
                            let info = HunterSourceInfo {
                                url: url.value,
                                url_arg: Some((
                                    rel_path.to_path_buf(),
                                    content[url.range].to_string(),
                                )),
                            };
                            packages
                                .entry(name.value.clone())
                                .or_default()
                                .versions
                                .insert(version.value.clone(), info);
                        }
                    }
                    "hunter_default_version" => {
                        let name = args.get(0);
                        let version = args.find_keyword_arg("VERSION");
                        if let Some((name, version)) = name.zip(version) {
                            packages
                                .entry(name.into())
                                .or_default()
                                .used_versions
                                .insert(version.value.clone());
                        }
                    }
                    _ => {}
                }
            }
        }
    }
    Ok(packages)
}
