{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  diagnostic_updater,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    self_test = substituteSource {
      src = fetchgit {
        name = "self_test-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "18f69be6ad19cc20d53bd3313b93d9a89bb34881";
        hash = "sha256-Diw5tBh6gDm6BN7WapvcC+Z3tb+HpU2yGqJzIL2UqpM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "self_test";
  version = "4.3.1-1";
  src = sources.self_test;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs diagnostic_updater rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "self_test";
  };
}
