{
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  rosSystemPackages,
  rviz_common,
  rviz_rendering,
  substituteSource,
  tf2_geometry_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_viz-1368b1b48e2bbd395801fa762ba6b607f9c81054 = substituteSource {
      src = fetchgit {
        name = "fuse_viz-1368b1b48e2bbd395801fa762ba6b607f9c81054-source";
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
  src = sources.fuse_viz-1368b1b48e2bbd395801fa762ba6b607f9c81054;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_msgs fuse_variables geometry_msgs rviz_common rviz_rendering tf2_geometry_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_viz package provides visualization tools for fuse.";
  };
}
