{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  eigen,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  generate_parameter_library,
  launch_testing_ament_cmake,
  message_filters,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_ros_occupancy_map_monitor,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  ros_testing,
  srdfdom,
  std_msgs,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_msgs,
  tf2_ros,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_planning = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "0b3b7b2e01ccc67f01a6214a468ef407440b27a1";
        hash = "sha256-mGutKWZONAbd2APXkqN5kCBsCLpgdjYtgZGWoOjZBgg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning";
  version = "2.10.0-1";
  src = sources.moveit_ros_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3_cmake_module ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp eigen fmt generate_parameter_library message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor pluginlib rclcpp rclcpp_action rclcpp_components srdfdom std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_msgs tf2_ros urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest launch_testing_ament_cmake moveit_configs_utils moveit_resources_panda_moveit_config ros_testing ];
  missingDependencies = [  ];
  meta = {
    description = "Planning components of MoveIt that use ROS";
  };
}
