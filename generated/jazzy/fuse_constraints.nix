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
        rev = "1200006240989303f086811f226ab7a841a124d6";
        hash = "sha256-c62NE6NrO6Amg2XxYP/AdRC42P1WIxHe7O6ypp7gOvE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_constraints";
  version = "1.1.1-1";
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
