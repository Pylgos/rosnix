{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  fmt,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_kinematics,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  pluginlib,
  rclcpp,
  rclcpp_action,
  ros_testing,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_move_group = substituteSource {
      src = fetchgit {
        name = "moveit_ros_move_group-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "d398d4e0c3ce6036310d0159e9465a8b62a19b89";
        hash = "sha256-U0PtBToT0E3CmCLzeIRuD+JqDiLKTC6jV/PjNZnxAiM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_move_group";
  version = "2.10.0-1";
  src = sources.moveit_ros_move_group;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ fmt moveit_common moveit_core moveit_kinematics moveit_ros_occupancy_map_monitor moveit_ros_planning pluginlib rclcpp rclcpp_action std_srvs tf2 tf2_geometry_msgs tf2_ros ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest moveit_configs_utils moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config ros_testing ];
  missingDependencies = [  ];
  meta = {
    description = "The move_group node for MoveIt";
  };
}
