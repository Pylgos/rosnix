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
  fuse_models,
  fuse_optimizers,
  fuse_publishers,
  fuse_variables,
  nav_msgs,
  rclcpp,
  rosSystemPackages,
  rviz2,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    fuse_tutorials-c842277611c37e6233a2bd06da8f8660677f0bb6 = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-c842277611c37e6233a2bd06da8f8660677f0bb6-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "c842277611c37e6233a2bd06da8f8660677f0bb6";
        hash = "sha256-0CIZCtVEMZceXY2Tq30oo/NCnqmcXavrMoG+GaGwFGE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_tutorials";
  version = "1.2.1-1";
  src = sources.fuse_tutorials-c842277611c37e6233a2bd06da8f8660677f0bb6;
  nativeBuildInputs = [ ament_cmake_ros wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ fuse_constraints fuse_core fuse_models fuse_optimizers fuse_publishers fuse_variables nav_msgs rclcpp rviz2 sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package containing source code for the fuse tutorials.";
  };
}
