use std::{
    collections::{BTreeMap, BTreeSet},
    path::{Path, PathBuf},
    sync::Arc,
};

use anyhow::Result;
use regex::Regex;
use serde::Deserialize;

#[derive(Debug, Deserialize)]
pub struct Config {
    #[serde(default = "default_cache_dir")]
    pub cache_dir: PathBuf,
    #[serde(default = "default_out_dir")]
    pub out_dir: PathBuf,
    #[serde(default)]
    pub distributions: Vec<String>,
    #[serde(default)]
    pub env: BTreeMap<String, BTreeMap<String, String>>,
    #[serde(default = "default_max_concurrent_downloads")]
    pub max_concurrent_downloads: usize,
    #[serde(default)]
    pub buildtool_packages: BTreeSet<String>,
    #[serde(default)]
    pub runtime_packages: BTreeSet<String>,
    #[serde(default)]
    pub buildtool_groups: BTreeSet<String>,
    #[serde(default)]
    pub runtime_groups: BTreeSet<String>,
    #[serde(default)]
    pub hybrid_packages: BTreeSet<String>,
    #[serde(default)]
    pub should_runtime_package: BTreeSet<String>,
    #[serde(default)]
    pub auto_patching: AutoPatchingConfig,
}

fn default_cache_dir() -> PathBuf {
    "cache".into()
}
fn default_out_dir() -> PathBuf {
    "generated".into()
}
fn default_max_concurrent_downloads() -> usize {
    32
}

#[derive(Debug, Default, Deserialize)]
pub struct AutoPatchingConfig {
    #[serde(default, with = "serde_regex")]
    pub ignore_files: Vec<Regex>,
    #[serde(default, with = "serde_regex")]
    pub ignore_urls: Vec<Regex>,
}

pub type ConfigRef = std::sync::Arc<Config>;

impl Default for Config {
    fn default() -> Self {
        Self {
            cache_dir: PathBuf::from("cache"),
            out_dir: PathBuf::from("nix/gen"),
            distributions: Vec::new(),
            env: BTreeMap::new(),
            max_concurrent_downloads: 32,
            buildtool_packages: Default::default(),
            runtime_packages: Default::default(),
            buildtool_groups: Default::default(),
            runtime_groups: Default::default(),
            hybrid_packages: Default::default(),
            should_runtime_package: Default::default(),
            auto_patching: Default::default(),
        }
    }
}

impl Config {
    pub fn load(path: impl AsRef<Path>) -> Result<Config> {
        Ok(toml::from_str(&std::fs::read_to_string(path.as_ref())?)?)
    }

    pub fn into_ref(self) -> ConfigRef {
        Arc::new(self)
    }

    pub fn create_directories(&self) -> std::io::Result<()> {
        std::fs::create_dir_all(&self.cache_dir)?;
        std::fs::create_dir_all(&self.out_dir)?;
        Ok(())
    }
}