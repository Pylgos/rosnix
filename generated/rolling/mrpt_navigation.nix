{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_map_server,
  mrpt_nav_interfaces,
  mrpt_pf_localization,
  mrpt_pointcloud_pipeline,
  mrpt_rawlog,
  mrpt_reactivenav2d,
  mrpt_tutorials,
  substituteSource,
}:
let
  sources = rec {
    mrpt_navigation = substituteSource {
      src = fetchgit {
        name = "mrpt_navigation-source";
        url = "https://github.com/ros2-gbp/mrpt_navigation-release.git";
        rev = "29d37274b19fa1bfc2cc86689e7ec02c4ec6f5bd";
        hash = "sha256-7ahIP3bxPFyM7IE249P9QyMmstpAMjH6E1goGKRlpoE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_navigation";
  version = "2.1.0-1";
  src = sources.mrpt_navigation;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt_map_server mrpt_nav_interfaces mrpt_pf_localization mrpt_pointcloud_pipeline mrpt_rawlog mrpt_reactivenav2d mrpt_tutorials ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Tools related to the Mobile Robot Programming Toolkit (MRPT). Refer to https://wiki.ros.org/mrpt_navigation for further documentation.";
  };
}
