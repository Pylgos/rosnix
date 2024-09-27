{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  control_msgs,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  gripper_controllers,
  joint_state_broadcaster,
  joint_trajectory_controller,
  joy,
  launch_param_builder,
  mkSourceSet,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  pluginlib,
  realtime_tools,
  robot_state_publisher,
  rosSystemPackages,
  ros_testing,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_eigen,
  tf2_ros,
  trajectory_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_servo" = substituteSource {
      src = fetchgit {
        name = "moveit_servo-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ab458985e678dec1fbef2287ce0411613c6e35a6";
        hash = "sha256-Gov1gnPjNRK27dzT8QcccXZBfx/rFMwWuJ7hnHTFyXA=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_servo";
  version = "2.11.0-1";
  src = sources."moveit_servo";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ control_msgs controller_manager generate_parameter_library geometry_msgs gripper_controllers joint_state_broadcaster joint_trajectory_controller joy launch_param_builder moveit_common moveit_configs_utils moveit_core moveit_msgs moveit_ros_planning moveit_ros_planning_interface pluginlib realtime_tools robot_state_publisher sensor_msgs std_msgs std_srvs tf2_eigen tf2_ros trajectory_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_resources_panda_moveit_config ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Provides real-time manipulator Cartesian and joint servoing.";
  };
}
