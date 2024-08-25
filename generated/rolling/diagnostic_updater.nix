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
        rev = "06e42e306472072aa04ba4bf4b17226f61fc4597";
        hash = "sha256-KAWRfucJofJJnbuh6aOY1GmC8Ddnev7OR15k8OsUX04=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_updater";
  version = "4.3.1-1";
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
