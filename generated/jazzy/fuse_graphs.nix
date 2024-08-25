{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ceres-solver,
  fetchgit,
  fetchurl,
  fetchzip,
  fuse_core,
  gbenchmark,
  pluginlib,
  rclcpp,
  substituteSource,
}:
let
  sources = rec {
    fuse_graphs = substituteSource {
      src = fetchgit {
        name = "fuse_graphs-source";
        url = "https://github.com/ros2-gbp/fuse-release.git";
        rev = "d0b61c3be9af005a8bc82a956e46093c53dab16d";
        hash = "sha256-AusfOIWBhrljSrjmV1TdhWQl0a1eq5cjsk1nCwPdOe0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_graphs";
  version = "1.1.1-1";
  src = sources.fuse_graphs;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ceres-solver fuse_core pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common gbenchmark ];
  missingDependencies = [  ];
  meta = {
    description = "The fuse_graphs package provides some concrete implementations of the fuse_core::Graph interface.";
  };
}
