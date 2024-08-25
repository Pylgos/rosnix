{
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_pytest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_pytest,
  launch_testing_ament_cmake,
  launch_testing_ros,
  pluginlib,
  rcl_interfaces,
  rclcpp,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_aggregator = substituteSource {
      src = fetchgit {
        name = "diagnostic_aggregator-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "1f45346ec02b79aec789d263341bdaf879eb4832";
        hash = "sha256-xM/v1Cr3gyDZbQhDfQrIVySZTpfixy8wh+/VslO3k9o=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_aggregator";
  version = "4.2.1-1";
  src = sources.diagnostic_aggregator;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs pluginlib rcl_interfaces rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch_pytest launch_testing_ament_cmake launch_testing_ros ];
  missingDependencies = [  ];
  meta = {
    description = "diagnostic_aggregator";
  };
}
