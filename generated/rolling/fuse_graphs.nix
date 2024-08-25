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
        rev = "1bad4f6b8670723bee18504d853167998a03dd88";
        hash = "sha256-OAhx+XniRLHvJMkD54lfbnCWK7EE3q/Evrh2skJwNeQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "fuse_graphs";
  version = "1.2.0-1";
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
