use anyhow::Result;
use serde::Serialize;
use std::collections::{BTreeMap, BTreeSet};

use crate::{
    config::ConfigRef,
    manifest::{PackageManifest, RosDependency, RosDependencyKind},
};

#[derive(Debug, Clone, Copy, Eq, PartialEq, PartialOrd, Ord, Serialize)]
pub enum NixDependencyKind {
    HostTarget,
    BuildHost,
    TargetTarget,
    Check,
}

#[derive(Debug, Clone, Eq, PartialEq, PartialOrd, Ord)]
pub struct NixDependency {
    pub name: String,
    pub kind: NixDependencyKind,
    pub propagated: bool,
    pub system_package: bool,
}

#[derive(Debug)]
pub struct NixDependencies {
    pub deps: BTreeSet<NixDependency>,
}

#[derive(Debug, Clone, Eq, PartialEq, PartialOrd, Ord, Serialize)]
struct ClassifiedRosDependency {
    name: String,
    kind: NixDependencyKind,
    propagated: bool,
}

fn find_qt_dependants(pkg_deps: &BTreeMap<String, NixDependencies>) -> BTreeSet<String> {
    let mut dependants = BTreeSet::new();
    let mut prev_dependants_len = 0;
    loop {
        for (name, deps) in pkg_deps.iter() {
            if deps
                .deps
                .iter()
                .any(|d| d.name.contains("qt5") || dependants.contains(&d.name))
            {
                dependants.insert(name.clone());
            }
        }

        if dependants.len() == prev_dependants_len {
            break;
        }
        prev_dependants_len = dependants.len();
    }
    dependants
}

pub fn resolve_dependencies(
    cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, NixDependencies>> {
    let package_deps = classify_dependencies(cfg, manifests)?;

    let resolve = |deps: &BTreeSet<ClassifiedRosDependency>| -> BTreeSet<NixDependency> {
        let mut res = BTreeSet::new();
        for dep in deps {
            res.insert(NixDependency {
                name: dep.name.clone(),
                kind: dep.kind,
                propagated: dep.propagated,
                system_package: !manifests.contains_key(&dep.name),
            });
        }
        res
    };

    let mut result = package_deps
        .into_iter()
        .map(|(name, deps)| {
            let dependencies = NixDependencies {
                deps: resolve(&deps),
            };
            (name, dependencies)
        })
        .collect();

    let qt_dependants = find_qt_dependants(&result);
    for name in qt_dependants {
        result.get_mut(&name).unwrap().deps.insert(NixDependency {
            name: "wrapRosQtAppsHook".to_string(),
            kind: NixDependencyKind::BuildHost,
            propagated: false,
            system_package: false,
        });
    }

    Ok(result)
}

fn is_propagation_required(dependency_kind: RosDependencyKind) -> bool {
    use RosDependencyKind::*;
    matches!(
        dependency_kind,
        Build | BuildExport | BuildtoolExport | Exec
    )
}

fn classify_dependencies(
    _cfg: &ConfigRef,
    manifests: &BTreeMap<String, PackageManifest>,
) -> Result<BTreeMap<String, BTreeSet<ClassifiedRosDependency>>> {
    Ok(manifests
        .values()
        .map(|m| {
            let deps = &m.dependencies.deps;
            let res: BTreeSet<ClassifiedRosDependency> = deps
                .iter()
                .flat_map(|d| {
                    match d.kind {
                        RosDependencyKind::Build
                        | RosDependencyKind::BuildExport
                        | RosDependencyKind::BuildtoolExport
                        | RosDependencyKind::Exec
                        | RosDependencyKind::Buildtool => {
                            [NixDependencyKind::BuildHost, NixDependencyKind::HostTarget].as_slice()
                        }
                        RosDependencyKind::Test => &[NixDependencyKind::Check].as_slice(),
                    }
                    .iter()
                    .copied()
                    .map(|kind| ClassifiedRosDependency {
                        name: d.name.clone(),
                        kind,
                        propagated: is_propagation_required(d.kind),
                    })
                })
                .collect();

            let res = res
                .iter()
                .filter(|d| {
                    d.propagated
                        || !res.contains(&ClassifiedRosDependency {
                            name: d.name.clone(),
                            kind: d.kind,
                            propagated: true,
                        })
                })
                .cloned()
                .collect();

            (m.name.clone(), res)
        })
        .collect())
}
