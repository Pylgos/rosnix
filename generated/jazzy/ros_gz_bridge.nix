{
  actuator_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gps_msgs,
  gz_msgs_vendor,
  gz_transport_vendor,
  launch_ros,
  launch_testing,
  launch_testing_ament_cmake,
  nav_msgs,
  pkg-config,
  rclcpp,
  rclcpp_components,
  ros_gz_interfaces,
  rosgraph_msgs,
  rosidl_pycommon,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2_msgs,
  trajectory_msgs,
  vision_msgs,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    ros_gz_bridge = substituteSource {
      src = fetchgit {
        name = "ros_gz_bridge-source";
        url = "https://github.com/ros2-gbp/ros_ign-release.git";
        rev = "06b83c1898e19e7c810ee1e4bb1139a81f8dd3e5";
        hash = "sha256-ObOPHjLerHPUGCsSBUBNkcC1kNkce5zWKxxgMlVftpU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "1.0.3-1";
  src = sources.ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake pkg-config rosidl_pycommon ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actuator_msgs geometry_msgs gps_msgs gz_msgs_vendor gz_transport_vendor nav_msgs rclcpp rclcpp_components ros_gz_interfaces rosgraph_msgs sensor_msgs std_msgs tf2_msgs trajectory_msgs vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
}
