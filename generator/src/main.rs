use anyhow::Result;
use clap::Parser;
use indicatif::ProgressStyle;
use std::fmt::Write as _;
use std::fs::File;
use std::io::Write as _;
use std::path::{Path, PathBuf};
use std::{collections::BTreeMap, sync::Arc};
use tokio::{process::Command, select};
use tracing::error;
use tracing::level_filters::LevelFilter;
use tracing_indicatif::IndicatifLayer;
use tracing_subscriber::layer::SubscriberExt;
use tracing_subscriber::util::SubscriberInitExt;
use tracing_subscriber::Layer;

use crate::{
    auto_patching::{auto_patch_source, PatchedSource},
    config::ConfigRef,
    deps::resolve_dependencies,
    rosindex::{DistroIndex, DistroStatus, PackageIndex},
    source::Fetcher,
};
use futures::{future, stream, StreamExt, TryStreamExt};
use tracing::info_span;
use tracing::Span;
use tracing_indicatif::span_ext::IndicatifSpanExt;

mod auto_patching;
mod cmake;
mod condition;
mod config;
mod deps;
mod hunter;
mod nixgen;
mod rosindex;
mod source;

#[derive(Debug, Parser)]
enum Subcommand {
    Generate {
        #[arg(long, short)]
        report_file: Option<PathBuf>,
    },
    CheckConfig,
}

#[derive(Debug, Parser)]
struct Args {
    #[command(subcommand)]
    subcommand: Subcommand,
    #[arg(long, short)]
    config_file: PathBuf,
}

async fn main_inner() -> Result<()> {
    let args = Args::parse();
    let cfg = config::Config::load(args.config_file)?.into_ref();
    cfg.create_directories()?;
    match args.subcommand {
        Subcommand::Generate { report_file } => {
            generate(&cfg, report_file.as_deref()).await?;
        }
        Subcommand::CheckConfig => {
            check_config(&cfg).await?;
        }
    }
    Ok(())
}

#[tokio::main]
async fn main() -> Result<()> {
    let indicatif_layer = IndicatifLayer::new().with_max_progress_bars(
        64,
        Some(ProgressStyle::with_template(
            "{pending_progress_bars} more..",
        )?),
    );

    tracing_subscriber::registry()
        .with(
            tracing_subscriber::fmt::layer()
                .with_writer(indicatif_layer.get_stderr_writer())
                .with_filter(LevelFilter::INFO),
        )
        .with(indicatif_layer)
        .init();

    select! {
        res = main_inner() => {
            if let Err(e) = &res {
                error!("{:?}", e);
            }
            res
        },
        _ = tokio::signal::ctrl_c() => anyhow::bail!("ctrl-c"),
    }
}

pub async fn fetch_sources(
    cfg: &ConfigRef,
    fetcher: &Arc<Fetcher>,
    pkg_index: &PackageIndex,
) -> Result<BTreeMap<String, PatchedSource>> {
    let span = info_span!("fetch_sources", distro = %pkg_index.name);
    span.pb_set_style(&ProgressStyle::default_bar());
    span.pb_set_length(pkg_index.manifests.len() as _);
    span.pb_set_position(1);
    let _enter = span.enter();
    let max_concurrent_downloads = fetcher.max_concurrent_downloads();
    let sources: BTreeMap<String, PatchedSource> = stream::iter(pkg_index.manifests.iter())
        .map(move |(name, manifest)| {
            let fetcher = fetcher.clone();
            let manifest = manifest.clone();
            let name = name.clone();
            let span = Span::current();
            let cfg = cfg.clone();
            tokio::spawn(async move {
                let src = fetcher
                    .fetch_git(name.as_str(), &manifest.repository, &manifest.tag)
                    .await?;
                let patched = auto_patch_source(&cfg, &fetcher, &src).await?;
                span.pb_inc(1);
                anyhow::Ok((name.clone(), patched))
            })
        })
        .buffer_unordered(max_concurrent_downloads)
        .then(|res| future::ready(res.unwrap()))
        .try_collect()
        .await?;
    Ok(sources)
}

pub async fn generate(cfg: &ConfigRef, report_dst: Option<&Path>) -> Result<()> {
    let distro_index = DistroIndex::fetch(cfg).await?;
    let fetcher = Fetcher::new_arc(cfg, "common");
    let mut diffs = BTreeMap::new();
    for package_index in distro_index.distros.values() {
        if package_index.status == DistroStatus::EndOfLife {
            continue;
        }
        if !cfg.distributions.contains(&package_index.name) {
            continue;
        }
        let deps = resolve_dependencies(cfg, &package_index.manifests)?;
        let patched_sources = fetch_sources(cfg, &fetcher, package_index).await?;
        let prev_versions = nixgen::prev_versions(cfg, &package_index.name)?;
        let distro_diffs = diff(
            &prev_versions,
            &package_index
                .manifests
                .iter()
                .map(|(k, m)| (k.clone(), m.release_version.clone()))
                .collect(),
        );
        diffs.insert(package_index.name.clone(), distro_diffs);
        nixgen::generate(cfg, package_index, &patched_sources, &deps)?;
    }
    if let Some(report_dst) = report_dst {
        write_report(report_dst, &diffs)?;
    }
    Ok(())
}

fn write_report(
    dst_path: &Path,
    diff: &BTreeMap<String, BTreeMap<String, DiffType>>,
) -> Result<()> {
    let mut dst = String::new();
    writeln!(dst, "## Changes")?;
    for (distro, diff) in diff {
        writeln!(dst, "### {distro}")?;
        if diff.is_empty() {
            writeln!(dst, "No changes")?;
        }
        for (name, diff) in diff {
            match diff {
                DiffType::Added(curr) => {
                    writeln!(dst, "- {name}: {curr} added")?;
                }
                DiffType::Removed(prev) => {
                    writeln!(dst, "- {name}: {prev} removed")?;
                }
                DiffType::Changed(prev, curr) => {
                    writeln!(dst, "- {name}: {prev} → {curr}")?;
                }
            }
        }
        writeln!(dst)?;
    }
    let mut f = File::create(dst_path)?;
    f.write_all(dst.as_bytes())?;
    Ok(())
}

enum DiffType {
    Added(String),
    Removed(String),
    Changed(String, String),
}

fn diff(
    prev: &BTreeMap<String, String>,
    curr: &BTreeMap<String, String>,
) -> BTreeMap<String, DiffType> {
    let mut result = BTreeMap::new();
    for (name, version) in curr {
        match prev.get(name) {
            Some(prev_version) if prev_version != version => {
                result.insert(
                    name.clone(),
                    DiffType::Changed(prev_version.clone(), version.clone()),
                );
            }
            None => {
                result.insert(name.clone(), DiffType::Added(version.clone()));
            }
            _ => {}
        }
    }
    for (name, prev_version) in prev.iter() {
        if !curr.contains_key(name) {
            result.insert(name.clone(), DiffType::Removed(prev_version.clone()));
        }
    }
    result
}

pub async fn check_config(_cfg: &ConfigRef) -> Result<()> {
    Ok(())
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub enum EvalResult {
    Success,
    NotFound,
    Removed,
    UnsupportedPlatform,
    Insecure,
    Unfree,
    UnknownError(String),
}

pub async fn can_evaluate_out_path(pkg: &str) -> Result<EvalResult> {
    let output = Command::new("nix")
        .arg("eval")
        .arg(format!(".#{pkg}.outPath"))
        .output()
        .await?;
    let err = String::from_utf8_lossy(&output.stderr);
    if output.status.success() {
        Ok(EvalResult::Success)
    } else if err.contains("has been removed") {
        Ok(EvalResult::Removed)
    } else if err.contains("does not provide attribute") {
        Ok(EvalResult::NotFound)
    } else if err.contains("is not available on the requested hostPlatform") {
        Ok(EvalResult::UnsupportedPlatform)
    } else if err.contains("is marked as insecure") {
        Ok(EvalResult::Insecure)
    } else if err.contains("has an unfree license") {
        Ok(EvalResult::Unfree)
    } else {
        Ok(EvalResult::UnknownError(err.to_string()))
    }
}
