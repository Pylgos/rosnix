{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_constraints,
  fuse_core,
  fuse_graphs,
  fuse_models,
  fuse_msgs,
  fuse_variables,
  geometry_msgs,
  launch,
  launch_pytest,
  launch_ros,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rosSystemPackages,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    fuse_optimizers-cfabad7a430ea1c75b98f294edddf5dd4679e1c6 = substituteSource {
      src = fetchgit {
        name = "fuse_optimizers-cfabad7a430ea1c75b98f294edddf5dd4679e1c6-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "cfabad7a430ea1c75b98f294edddf5dd4679e1c6";
        hash = "sha256-dabQsl6P+3hhZYHysGHSSw3bSnbLe+0tgaMNcYyu6kY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_optimizers";
  version = "1.1.1-1";
  src = sources.fuse_optimizers-cfabad7a430ea1c75b98f294edddf5dd4679e1c6;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_updater fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_variables pluginlib rclcpp rclcpp_components std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" "libceres-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common fuse_models geometry_msgs launch launch_pytest launch_ros nav_msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The fuse_optimizers package provides a set of optimizer implementations. An optimizer is the object responsible \\ for coordinating the sensors and motion model inputs, computing the optimal state values, and providing access to \\ to the optimal state via the publishers.";
  };
}
