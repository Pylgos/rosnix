use anyhow::{bail, Result};
use serde::Deserialize;
use serde_roxmltree::Options as _;
use std::collections::{BTreeMap, BTreeSet};

use crate::condition::eval_condition;

#[derive(Debug, Clone)]
pub struct PackageManifest {
    pub name: String,
    pub description: String,
    pub dependencies: RosDependencies,
    pub member_of_group: BTreeSet<String>,
    pub build_type: String,
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

impl PackageManifest {
    pub fn parse(xml_str: &str, env: &BTreeMap<String, String>) -> Result<Self> {
        #[derive(Debug, Deserialize)]
        struct Doc {
            #[serde(default)]
            name: String,
            #[serde(default)]
            description: String,
            #[serde(default)]
            build_depend: Vec<CondText>,
            #[serde(default)]
            build_export_depend: Vec<CondText>,
            #[serde(default)]
            buildtool_depend: Vec<CondText>,
            #[serde(default)]
            buildtool_export_depend: Vec<CondText>,
            #[serde(default)]
            exec_depend: Vec<CondText>,
            #[serde(default)]
            test_depend: Vec<CondText>,
            #[serde(default)]
            depend: Vec<CondText>,
            #[serde(default)]
            group_depend: Vec<CondText>,
            #[serde(default)]
            member_of_group: Vec<String>,
            #[serde(default)]
            export: Option<Export>,
        }

        #[derive(Debug, Deserialize)]
        struct Export {
            #[serde(default)]
            build_type: Vec<CondText>,
        }

        #[derive(Debug, Deserialize)]
        struct CondText {
            #[serde(rename = "@condition")]
            condition: Option<String>,
            #[serde(rename = "$text")]
            text: String,
        }

        let check_condition = |cond_text: &CondText| -> Option<String> {
            if let Some(cond) = &cond_text.condition {
                if eval_condition(cond, env).unwrap() {
                    Some(cond_text.text.clone())
                } else {
                    None
                }
            } else {
                Some(cond_text.text.clone())
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
                .filter_map(check_condition)
                .map(move |text| RosDependency { name: text, kind })
        })
        .collect();

        let group_deps = doc
            .group_depend
            .iter()
            .filter_map(check_condition)
            .collect();

        let ros_deps = RosDependencies { deps, group_deps };

        let build_type = doc
            .export
            .as_ref()
            .and_then(|export| {
                export
                    .build_type
                    .iter()
                    .filter_map(|build_type| check_condition(build_type))
                    .next()
            })
            .unwrap_or_else(|| "catkin".to_string());

        Ok(Self {
            name: doc.name,
            description: doc.description,
            dependencies: ros_deps,
            member_of_group: doc.member_of_group.into_iter().collect(),
            build_type,
        })
    }
}
