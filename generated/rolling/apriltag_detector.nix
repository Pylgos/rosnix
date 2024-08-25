{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_clang_format,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  apriltag_msgs,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  pluginlib,
  rclcpp,
  rclcpp_components,
  ros_environment,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    apriltag_detector = substituteSource {
      src = fetchgit {
        name = "apriltag_detector-source";
        url = "https://github.com/ros2-gbp/apriltag_detector-release.git";
        rev = "0fc1d9d94f0f94656eddf0aab4f20cd3f911b302";
        hash = "sha256-iw/b7F4XHEzACalAypSBbAltkD0O69nSKk5qIc+yRIA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apriltag_detector";
  version = "2.0.0-1";
  src = sources.apriltag_detector;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ament_cmake_ros ros_environment ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ apriltag_msgs pluginlib rclcpp rclcpp_components sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_clang_format ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "ROS2 package for apriltag detection";
  };
}
