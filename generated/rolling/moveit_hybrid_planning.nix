{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_planners_ompl,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_simple_controller_manager,
  pluginlib,
  position_controllers,
  rclcpp,
  rclcpp_action,
  rclcpp_components,
  robot_state_publisher,
  rosSystemPackages,
  ros_testing,
  rviz2,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_ros,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_hybrid_planning = substituteSource {
      src = fetchgit {
        name = "moveit_hybrid_planning-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "5d04be9286683df4ecf207689ec0d8fd9391eb7d";
        hash = "sha256-x19XytU9ToWagITV+a0cam7SLgASAGczCkjTSQu1C8E=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_hybrid_planning";
  version = "2.11.0-1";
  src = sources.moveit_hybrid_planning;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp controller_manager moveit_common moveit_core moveit_msgs moveit_resources_panda_moveit_config moveit_ros_planning moveit_ros_planning_interface pluginlib position_controllers rclcpp rclcpp_action rclcpp_components robot_state_publisher rviz2 std_msgs std_srvs tf2_ros trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest controller_manager moveit_configs_utils moveit_planners_ompl moveit_resources_panda_moveit_config moveit_simple_controller_manager position_controllers robot_state_publisher ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Hybrid planning components of MoveIt 2";
  };
}
