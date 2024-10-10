use anyhow::{bail, Result};
use indenter::indented;
use regex::Regex;
use std::collections::{BTreeMap, BTreeSet};
use std::fmt::Write;
use std::fs;
use std::io::Write as _;
use std::path::{Path, PathBuf};
use tracing::warn;

use crate::auto_patching::{PatchedSource, Replacement};
use crate::deps::{NixDependency, NixDependencyKind};
use crate::rosindex::BuildType;
use crate::source::SourceKind;
use crate::{
    config::ConfigRef,
    deps::NixDependencies,
    rosindex::{PackageIndex, PackageManifest},
};

struct Ctx<'a> {
    distro_dir: PathBuf,
    package_index: &'a PackageIndex,
    sources: &'a BTreeMap<String, PatchedSource>,
    deps: &'a BTreeMap<String, NixDependencies>,
}

fn spliced_set_name(kind: NixDependencyKind) -> Option<&'static str> {
    use NixDependencyKind::*;
    match kind {
        HostTarget => None,
        BuildHost => Some("buildPackages"),
        TargetTarget => Some("pkgsTargetTarget"),
        Check => None,
    }
}

fn escape(s: &str) -> String {
    let mut escaped = String::new();
    escaped.push('"');
    let mut chars = s.chars().peekable();
    while let Some(c) = chars.next() {
        let maybe_next = chars.peek();
        match c {
            '$' if maybe_next == Some(&'{') => {
                escaped.push_str("\\$");
            }
            '\\' => escaped.push_str("\\\\"),
            '"' => escaped.push_str("\\\""),
            '\n' => escaped.push_str("\\n"),
            _ => escaped.push(c),
        }
    }
    escaped.push('"');
    escaped
}

fn quote(s: &str) -> String {
    format!("\"{}\"", s)
}

fn normalize_attr_name(name: &str) -> String {
    name.replace('_', "-")
}

fn builder_fn(build_type: BuildType) -> &'static str {
    match build_type {
        BuildType::Catkin => "buildCatkinPackage",
        BuildType::Cmake => "buildCmakePackage",
        BuildType::AmentCmake => "buildAmentCmakePackage",
        BuildType::AmentPython => "buildAmentPythonPackage",
        BuildType::Meson => "buildMesonPackage",
    }
}

fn generate_parameters(
    ctx: &Ctx,
    mut dst: impl Write,
    manifest: &PackageManifest,
    extra_packages: &BTreeSet<String>,
) -> Result<()> {
    let mut params: BTreeSet<_> = ctx.deps[&manifest.name]
        .deps
        .iter()
        .filter(|dep| !dep.system_package)
        .map(|dep| match spliced_set_name(dep.kind) {
            Some(set_name) if dep.name.contains('.') => set_name.to_string(),
            _ => {
                if dep.name.contains('.') {
                    dep.name.split('.').next().unwrap().to_string()
                } else {
                    normalize_attr_name(&dep.name)
                }
            }
        })
        .chain(extra_packages.clone())
        .collect();
    let build_fn = builder_fn(manifest.build_type);
    params.extend(
        [
            build_fn,
            "fetchgit",
            "fetchurl",
            "fetchzip",
            "mkSourceSet",
            "rosSystemPackages",
            "substituteSource",
        ]
        .into_iter()
        .map(|s| s.to_string()),
    );
    writeln!(dst, "{{")?;
    for param in params {
        writeln!(dst, "  {param},")?;
    }
    writeln!(dst, "}}:")?;
    Ok(())
}

fn generate_package_body(ctx: &Ctx, mut dst: impl Write, manifest: &PackageManifest) -> Result<()> {
    writeln!(dst, "pname = {};", escape(&manifest.name))?;
    writeln!(dst, "version = {};", escape(&manifest.release_version))?;
    writeln!(
        dst,
        "src = finalAttrs.passthru.sources.{};",
        escape(ctx.sources[&manifest.name].local_name())
    )?;
    let deps = &ctx.deps[&manifest.name];
    let get_dep_string = |kind: NixDependencyKind, propagated: bool| -> String {
        let ros_pkgs_str = deps
            .deps
            .iter()
            .filter(|dep| dep.kind == kind && dep.propagated == propagated)
            .filter(|dep| !dep.system_package)
            .map(|dep: &NixDependency| normalize_attr_name(&dep.name))
            .collect::<Vec<_>>()
            .join(" ");
        let system_pkgs_str = deps
            .deps
            .iter()
            .filter(|dep| dep.kind == kind && dep.propagated == propagated)
            .filter(|dep| dep.system_package)
            .map(|dep| escape(&dep.name))
            .collect::<Vec<_>>()
            .join(" ");
        let pkgs_for = match kind {
            NixDependencyKind::HostTarget => "forBuildInputs",
            NixDependencyKind::BuildHost => "forNativeBuildInputs",
            NixDependencyKind::TargetTarget => "forDepsTargetTarget",
            NixDependencyKind::Check => "forBuildInputs",
        };
        format!("[ {ros_pkgs_str} ] ++ rosSystemPackages.getPackages {{ {pkgs_for} = [ {system_pkgs_str} ]; }}")
    };
    writeln!(
        dst,
        "nativeBuildInputs = {};",
        get_dep_string(NixDependencyKind::BuildHost, false)
    )?;
    writeln!(
        dst,
        "propagatedNativeBuildInputs = {};",
        get_dep_string(NixDependencyKind::BuildHost, true)
    )?;
    writeln!(
        dst,
        "buildInputs = {};",
        get_dep_string(NixDependencyKind::HostTarget, false)
    )?;
    writeln!(
        dst,
        "propagatedBuildInputs = {};",
        get_dep_string(NixDependencyKind::HostTarget, true)
    )?;
    writeln!(
        dst,
        "depsTargetTarget = {};",
        get_dep_string(NixDependencyKind::TargetTarget, false)
    )?;
    writeln!(
        dst,
        "depsTargetTargetPropagated = {};",
        get_dep_string(NixDependencyKind::TargetTarget, true)
    )?;
    writeln!(
        dst,
        "checkInputs = {};",
        get_dep_string(NixDependencyKind::Check, false)
    )?;
    writeln!(dst, "passthru = {{")?;
    writeln!(dst, "  inherit sources;")?;
    writeln!(dst, "}};")?;
    writeln!(dst, "meta = {{")?;
    writeln!(dst, "  description = {};", escape(&manifest.description))?;
    writeln!(dst, "}};")?;
    Ok(())
}

fn generate_package(ctx: &Ctx, dst_path: &Path, manifest: &PackageManifest) -> Result<()> {
    let mut dst = String::new();
    let mut all_srcs = BTreeMap::new();
    let mut extra_packages = BTreeSet::new();
    collect_sources_and_packages(
        &mut all_srcs,
        &mut extra_packages,
        &ctx.sources[&manifest.name],
    );
    generate_parameters(ctx, &mut dst, manifest, &extra_packages)?;
    writeln!(dst, "let")?;
    writeln!(dst, "  sources = mkSourceSet (sources: {{")?;
    generate_source_list(
        indented(&mut dst).with_str("    "),
        all_srcs.values().copied(),
    )?;
    writeln!(dst, "  }});")?;
    writeln!(dst, "in")?;
    let builder_fn = builder_fn(manifest.build_type);
    writeln!(dst, "{builder_fn} (finalAttrs: {{")?;
    generate_package_body(ctx, indented(&mut dst).with_str("  "), manifest)?;
    writeln!(dst, "}})")?;
    let mut file = std::fs::File::create(dst_path)?;
    file.write_all(dst.as_bytes())?;
    Ok(())
}

fn collect_sources_and_packages<'a>(
    sources: &mut BTreeMap<String, &'a PatchedSource>,
    packages: &mut BTreeSet<String>,
    src: &'a PatchedSource,
) {
    sources.insert(src.local_name().to_string(), src);
    for sub in src.substitutions.iter() {
        match &sub.with {
            Replacement::Path(src) => collect_sources_and_packages(sources, packages, src),
            Replacement::Url(src) => collect_sources_and_packages(sources, packages, src),
            Replacement::Download(src) => collect_sources_and_packages(sources, packages, src),
            Replacement::Prefixed(_, src) => collect_sources_and_packages(sources, packages, src),
            Replacement::Literal(_) => {}
            Replacement::Shebang(_, _) => {
                packages.insert("buildPackages".into());
            }
        }
    }
}

fn generate_source_list<'a>(
    mut dst: impl Write,
    sources: impl IntoIterator<Item = &'a PatchedSource>,
) -> Result<()> {
    for src in sources.into_iter() {
        let local_name = src.local_name();
        let drv_name = src.source.name().to_string() + "-source";
        writeln!(dst, "{} = substituteSource {{", escape(local_name))?;
        write!(dst, "  src = ")?;
        match src.source.kind() {
            SourceKind::Git { rev } => {
                writeln!(dst, "fetchgit {{")?;
                writeln!(dst, "    name = {};", escape(&drv_name))?;
                writeln!(dst, "    url = {};", escape(src.source.url()))?;
                writeln!(dst, "    rev = {};", escape(rev))?;
                writeln!(dst, "    hash = {};", escape(src.source.nar_hash()))?;
                writeln!(dst, "  }};")?;
            }
            SourceKind::UnpackedArchive => {
                writeln!(dst, "fetchzip {{")?;
                writeln!(dst, "    name = {};", escape(&drv_name))?;
                writeln!(dst, "    url = {};", escape(src.source.url()))?;
                writeln!(dst, "    hash = {};", escape(src.source.nar_hash()))?;
                writeln!(dst, "  }};")?;
            }
            SourceKind::File => {
                writeln!(dst, "fetchurl {{")?;
                writeln!(dst, "    name = {};", escape(&drv_name))?;
                writeln!(dst, "    url = {};", escape(src.source.url()))?;
                writeln!(dst, "    hash = {};", escape(src.source.nar_hash()))?;
                writeln!(dst, "  }};")?;
            }
        }
        writeln!(dst, "  substitutions = [")?;
        for sub in src.substitutions.iter() {
            writeln!(dst, "    {{")?;
            writeln!(dst, "      path = {};", escape(sub.path.to_str().unwrap()))?;
            writeln!(dst, "      from = {};", escape(&sub.from))?;
            match &sub.with {
                Replacement::Path(with_src) => {
                    writeln!(
                        dst,
                        "      to = {};",
                        quote(&format!(
                            "VCS_TYPE path VCS_URL ${{sources.{}}}",
                            escape(with_src.local_name())
                        ))
                    )?;
                }
                Replacement::Url(with_src) => {
                    writeln!(
                        dst,
                        "      to = {};",
                        quote(&format!(
                            "URL ${{sources.{}}}",
                            escape(with_src.local_name())
                        ))
                    )?;
                }
                Replacement::Literal(to) => {
                    writeln!(dst, "      to = {};", escape(to))?;
                }
                Replacement::Download(with_src) => {
                    writeln!(
                        dst,
                        "      to = {};",
                        quote(&format!(
                            "DOWNLOAD file://${{sources.{}}}",
                            escape(with_src.local_name())
                        ))
                    )?;
                }
                Replacement::Prefixed(prefix, with_src) => {
                    writeln!(
                        dst,
                        "      to = {} + {};",
                        escape(prefix),
                        quote(&format!("${{sources.{}}}", escape(with_src.local_name())))
                    )?;
                }
                Replacement::Shebang(package, program) => {
                    writeln!(
                        dst,
                        "      to = {};",
                        quote(&format!("#!${{buildPackages.{package}}}/bin/{program}"))
                    )?;
                }
            }
            writeln!(dst, "    }}")?;
        }
        writeln!(dst, "  ];")?;
        writeln!(dst, "}};")?;
    }

    Ok(())
}

fn generate_distro(ctx: &Ctx) -> Result<()> {
    {
        let mut marker_file = fs::File::create(ctx.distro_dir.join("GENERATED"))?;
        writeln!(
            marker_file,
            "This directory was generated by rosnix-generator"
        )?;
    }

    for (pkg_name, manifest) in ctx.package_index.manifests.iter() {
        let mangled_name = normalize_attr_name(pkg_name);
        let dir_name = &mangled_name[..2.min(mangled_name.len())];
        let pkg_dir_path = ctx.distro_dir.join(dir_name);
        fs::create_dir_all(&pkg_dir_path)?;
        let pkg_file_path = pkg_dir_path.join(format!("{}.nix", mangled_name));
        generate_package(ctx, &pkg_file_path, manifest)?;
    }
    Ok(())
}

pub fn generate(
    cfg: &ConfigRef,
    package_index: &PackageIndex,
    sources: &BTreeMap<String, PatchedSource>,
    deps: &BTreeMap<String, NixDependencies>,
) -> Result<()> {
    let distro_dir = cfg.out_dir.join(&package_index.name);
    let ctx = Ctx {
        package_index,
        sources,
        deps,
        distro_dir,
    };

    if ctx.distro_dir.is_dir() {
        if ctx.distro_dir.join("GENERATED").is_file() {
            fs::remove_dir_all(&ctx.distro_dir)?;
        } else {
            bail!("output directory already exists and is not generated by rosnix-generator");
        }
    }

    fs::create_dir_all(&ctx.distro_dir)?;
    generate_distro(&ctx)?;
    Ok(())
}

pub fn prev_versions(cfg: &ConfigRef, distro_name: &str) -> Result<BTreeMap<String, String>> {
    let distro_dir = cfg.out_dir.join(distro_name);
    if !distro_dir.is_dir() {
        return Ok(BTreeMap::new());
    }
    let mut versions = BTreeMap::new();
    let pname_re = Regex::new(r#"pname\s*=\s*"([^"]*)";"#).unwrap();
    let version_re = Regex::new(r#"version\s*=\s*"([^"]*)";"#).unwrap();
    for entry in fs::read_dir(&distro_dir)? {
        let entry = entry?;
        if !entry.file_type()?.is_dir() {
            continue;
        }
        let dir_path = entry.path();
        for entry in fs::read_dir(&dir_path)? {
            let entry = entry?;
            if !entry.file_type()?.is_file() {
                continue;
            }
            let path = entry.path();
            if !path.extension().map_or(false, |ext| ext == "nix") {
                continue;
            }
            let content = fs::read_to_string(&path)?;
            let Some(pname_caps) = pname_re.captures(&content) else {
                warn!("failed to read pname from {}", path.display());
                continue;
            };
            let Some(version_caps) = version_re.captures(&content) else {
                warn!("failed to read version from {}", path.display());
                continue;
            };
            versions.insert(pname_caps[1].to_string(), version_caps[1].to_string());
        }
    }
    Ok(versions)
}
