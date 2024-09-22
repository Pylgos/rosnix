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
    fuse_tutorials = substituteSource {
      src = fetchgit {
        name = "fuse_tutorials-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "f232a1b1da77324067d9d5fa4433af543fd2f9bc";
        hash = "sha256-jix3x/BhHI2P7id3wpsr2TRpqn3Mp/Q+ppU0oZwwSBU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_tutorials";
  version = "1.1.1-1";
  src = sources.fuse_tutorials;
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
