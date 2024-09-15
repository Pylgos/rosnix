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
    fuse_viz = substituteSource {
      src = fetchgit {
        name = "fuse_viz-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "fcdcaa2a5fe9c82d74a3c69eeaaa3fbb5d07ffa2";
        hash = "sha256-fEdSyUDCk4WGGN0YNLus/lXLKoD4XxC0IbDG5+YWn6U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_viz";
  version = "1.2.0-1";
  src = sources.fuse_viz;
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
