{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_warehouse,
  moveit_simple_controller_manager,
  rclcpp,
  rclcpp_action,
  rclpy,
  rosSystemPackages,
  ros_testing,
  rviz2,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_planning_interface = substituteSource {
      src = fetchgit {
        name = "moveit_ros_planning_interface-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "651babb8c7c8f6def4d0b32851564b07c6fc413f";
        hash = "sha256-LyXQVbAHkCqEPgV96kQUi7a4P4PKxhDCnBlX0igjFGU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_planning_interface";
  version = "2.10.0-1";
  src = sources.moveit_ros_planning_interface;
  nativeBuildInputs = [ ament_cmake eigen3_cmake_module wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs moveit_common moveit_core moveit_msgs moveit_ros_move_group moveit_ros_planning moveit_ros_warehouse rclcpp rclcpp_action rclpy tf2 tf2_eigen tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_configs_utils moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config moveit_simple_controller_manager ros_testing rviz2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt that offer simpler remote (as from another ROS 2 node) interfaces to planning and execution";
  };
}
