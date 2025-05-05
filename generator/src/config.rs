use std::{
    collections::BTreeMap,
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
    #[serde(default = "default_index_rev")]
    pub index_rev: String,
    #[serde(default)]
    pub env: BTreeMap<String, BTreeMap<String, String>>,
    #[serde(default = "default_max_concurrent_downloads")]
    pub max_concurrent_downloads: usize,
    #[serde(default)]
    pub auto_patching: AutoPatchingConfig,
}

fn default_cache_dir() -> PathBuf {
    "cache".into()
}
fn default_out_dir() -> PathBuf {
    "generated".into()
}
fn default_index_rev() -> String {
    "master".into()
}
fn default_max_concurrent_downloads() -> usize {
    32
}

#[derive(Debug, Deserialize)]
pub struct UrlReplace {
    #[serde(with = "serde_regex")]
    pub from: Regex,
    pub to: String,
}

#[derive(Debug, Default, Deserialize)]
pub struct AutoPatchingConfig {
    #[serde(default, with = "serde_regex")]
    pub ignore_files: Vec<Regex>,
    #[serde(default, with = "serde_regex")]
    pub ignore_urls: Vec<Regex>,
    pub replace_urls: Vec<UrlReplace>,
}

pub type ConfigRef = std::sync::Arc<Config>;

impl Default for Config {
    fn default() -> Self {
        Self {
            cache_dir: PathBuf::from("cache"),
            out_dir: PathBuf::from("nix/gen"),
            index_rev: "master".into(),
            distributions: Vec::new(),
            env: BTreeMap::new(),
            max_concurrent_downloads: 32,
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
