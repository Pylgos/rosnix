{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  diagnostic_updater,
  eigen,
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
  python3Packages,
  rclcpp,
  rclcpp_components,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    fuse_optimizers = substituteSource {
      src = fetchgit {
        name = "fuse_optimizers-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "2932c74fac749c78d0038e34e1d11ffa5567c00a";
        hash = "sha256-JR/RqR1xzblTMsEH7XlJL+xGJN2Vx0/0WcSAUq0DGak=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_optimizers";
  version = "1.2.0-1";
  src = sources.fuse_optimizers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver diagnostic_updater eigen fuse_constraints fuse_core fuse_graphs fuse_msgs fuse_variables pluginlib python3Packages.boost rclcpp rclcpp_components std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common fuse_models geometry_msgs launch launch_pytest launch_ros nav_msgs rclcpp ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_optimizers package provides a set of optimizer implementations. An optimizer is the object responsible \\ for coordinating the sensors and motion model inputs, computing the optimal state values, and providing access to \\ to the optimal state via the publishers.";
  };
}
