{
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_cmake_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rclcpp,
  rclcpp_components,
  rclpy,
  ros2cli,
  rosidl_default_generators,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  topic_tools_interfaces,
}:
let
  sources = rec {
    topic_tools = substituteSource {
      src = fetchgit {
        name = "topic_tools-source";
        url = "https://github.com/ros2-gbp/topic_tools-release.git";
        rev = "68e05f5af89a64ceea47d51607b67066412ba43e";
        hash = "sha256-maSjbWC7ie5nCohC1Tg5QDoTDmSpwBflgbzy+o361jA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_tools";
  version = "1.3.0-3";
  src = sources.topic_tools;
  nativeBuildInputs = [ ament_cmake_auto ament_cmake_python rosidl_default_generators ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclcpp rclcpp_components rclpy ros2cli rosidl_runtime_py topic_tools_interfaces ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common rosidl_runtime_py std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Tools for directing, throttling, selecting, and otherwise messing with ROS 2 topics at a meta level.";
  };
}
