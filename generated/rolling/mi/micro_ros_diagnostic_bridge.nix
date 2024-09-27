{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  diagnostic_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  micro_ros_diagnostic_msgs,
  osrf_testing_tools_cpp,
  rclcpp,
  rosSystemPackages,
  ros_environment,
  substituteSource,
}:
let
  sources = rec {
    micro_ros_diagnostic_bridge-0f33e6bccd242b2af077b401a2239f84c9683494 = substituteSource {
      src = fetchgit {
        name = "micro_ros_diagnostic_bridge-0f33e6bccd242b2af077b401a2239f84c9683494-source";
        url = "https://github.com/ros2-gbp/micro_ros_diagnostics-release.git";
        rev = "0f33e6bccd242b2af077b401a2239f84c9683494";
        hash = "sha256-mBsQdSKOPVQJVBc/FxvaxH5NOtAJy3M+bYciq7eHg+c=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "micro_ros_diagnostic_bridge";
  version = "0.3.0-5";
  src = sources.micro_ros_diagnostic_bridge-0f33e6bccd242b2af077b401a2239f84c9683494;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ diagnostic_msgs micro_ros_diagnostic_msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common diagnostic_msgs micro_ros_diagnostic_msgs osrf_testing_tools_cpp ros_environment ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Translates micro-ROS diagnostic messages to vanilla ROS 2 diagnostic messages.";
  };
}
