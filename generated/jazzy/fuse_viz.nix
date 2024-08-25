{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  qt5,
  rviz_common,
  rviz_rendering,
  substituteSource,
  tf2_geometry_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_viz = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "1368b1b48e2bbd395801fa762ba6b607f9c81054";
        hash = "sha256-lnugFK/IinY63VpqqOFq53NwuUHa/hYedDm1S0QM30E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_viz";
  version = "1.1.1-1";
  src = sources.fuse_viz;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ eigen fuse_constraints fuse_core fuse_msgs fuse_variables geometry_msgs qt5.qtbase rviz_common rviz_rendering tf2_geometry_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_viz package provides visualization tools for fuse.";
  };
}
