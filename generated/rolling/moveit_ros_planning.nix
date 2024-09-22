{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  eigen3_cmake_module,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
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
  rosSystemPackages,
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
      src = fetchFromGitHub {
        name = "moveit_ros_planning-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "c11121878648022aee751c9c630ce7c4c23bad3e";
        hash = "sha256-QIve6UhlfaK/LyaV9NXlCGWoBgbaFNCYq2vU0nq+wW4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning";
  version = "2.11.0-1";
  src = sources.moveit_ros_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp generate_parameter_library message_filters moveit_common moveit_core moveit_msgs moveit_ros_occupancy_map_monitor pluginlib rclcpp rclcpp_action rclcpp_components srdfdom std_msgs tf2 tf2_eigen tf2_geometry_msgs tf2_msgs tf2_ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest launch_testing_ament_cmake moveit_configs_utils moveit_resources_panda_moveit_config ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Planning components of MoveIt that use ROS";
  };
}
