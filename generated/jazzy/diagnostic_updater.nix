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
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_updater = substituteSource {
      src = fetchgit {
        name = "diagnostic_updater-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "8eec70691fa50040dab0564f7553273f2f76615a";
        hash = "sha256-l8Doi5cd8VshXDpCzrPhRRL9QU8w/01pI3v+jE8q30c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_updater";
  version = "4.2.1-1";
  src = sources.diagnostic_updater;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ diagnostic_msgs rclcpp rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch launch_testing launch_testing_ros python3Packages.pytest rclcpp_lifecycle ];
  missingDependencies = [  ];
  meta = {
    description = "diagnostic_updater contains tools for easily updating diagnostics. it is commonly used in device drivers to keep track of the status of output topics, device status, etc.";
  };
}
