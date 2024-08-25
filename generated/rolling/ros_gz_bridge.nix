{
  actuator_msgs,
  ament_cmake,
  ament_cmake_gtest,
  ament_cmake_python,
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
  launch,
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
        rev = "6f252b46859b80e65ef6aab255553e5cd6ff5f4a";
        hash = "sha256-chlgJ7zCvlRsOVb4XaRWQ3sqQf8V9rLPJHgoSIUedgs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros_gz_bridge";
  version = "2.0.0-1";
  src = sources.ros_gz_bridge;
  nativeBuildInputs = [ ament_cmake ament_cmake_python pkg-config rosidl_pycommon ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ actuator_msgs geometry_msgs gps_msgs gz_msgs_vendor gz_transport_vendor launch launch_ros nav_msgs rclcpp rclcpp_components ros_gz_interfaces rosgraph_msgs sensor_msgs std_msgs tf2_msgs trajectory_msgs vision_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch_ros launch_testing launch_testing_ament_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "Bridge communication between ROS and Gazebo Transport";
  };
}
