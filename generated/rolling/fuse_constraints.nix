{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  eigen,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  fuse_graphs,
  fuse_variables,
  gbenchmark,
  geometry_msgs,
  pluginlib,
  rclcpp,
  substituteSource,
  suitesparse,
}:
let
  sources = rec {
    fuse_constraints = substituteSource {
      src = fetchgit {
        name = "fuse_constraints-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d8f46ad8c87f7a535538f49a50b3c409e7c60ef8";
        hash = "sha256-lJ5LV3USpNdPXZkkiq9w0tDV9iGXEc6XDxbIrEbuPlw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_constraints";
  version = "1.2.0-1";
  src = sources.fuse_constraints;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver eigen fuse_core fuse_graphs fuse_variables geometry_msgs pluginlib rclcpp suitesparse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common gbenchmark ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_constraints package provides a set of commonly used constraint types, such as direct measurements on \\ state variables (absolute constraints) or measurements of the state changes (relative constraints).";
  };
}
