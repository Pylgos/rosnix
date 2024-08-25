{
  ament_cmake,
  ament_cmake_pytest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ament_cmake,
  launch_testing_ros,
  pkg-config,
  pluginlib,
  python3Packages,
  rclcpp,
  std_msgs,
  substituteSource,
  zstd,
}:
let
  sources = rec {
    network_bridge = substituteSource {
      src = fetchgit {
        name = "network_bridge-source";
        url = "https://github.com/ros2-gbp/network_bridge-release.git";
        rev = "c625bfef13c67072a1a39f37fc3859d5f3cfb27b";
        hash = "sha256-Gfm+jv0L73LlZMytVTDOCyqyBGqctp6URffWJU/opmk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "network_bridge";
  version = "1.0.2-1";
  src = sources.network_bridge;
  nativeBuildInputs = [ ament_cmake pkg-config ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ pluginlib python3Packages.boost rclcpp std_msgs zstd ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_pytest ament_lint_auto ament_lint_common launch_testing launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "Allows for arbitrary network links (UDP, TCP, etc) to bridge ROS2 messages";
  };
}
