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
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    diagnostic_aggregator-37a392e96761542fcda890216b400d1bf36bd09a = substituteSource {
      src = fetchgit {
        name = "diagnostic_aggregator-37a392e96761542fcda890216b400d1bf36bd09a-source";
        url = "https://github.com/ros2-gbp/diagnostics-release.git";
        rev = "37a392e96761542fcda890216b400d1bf36bd09a";
        hash = "sha256-W0Tdf/Yhy7H7CY58VyRJMmJ+M2279VMtp+BEhLvriZA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "diagnostic_aggregator";
  version = "4.3.1-1";
  src = sources.diagnostic_aggregator-37a392e96761542fcda890216b400d1bf36bd09a;
  nativeBuildInputs = [ ament_cmake ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs pluginlib rcl_interfaces rclcpp rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_cmake_pytest ament_lint_auto ament_lint_common launch_pytest launch_testing_ament_cmake launch_testing_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "diagnostic_aggregator";
  };
}
