{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  control_msgs,
  controller_manager,
  fetchFromGitHub,
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
  sources = rec {
    moveit_servo = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_servo-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "cb66905f35b3d028d549fedb54280842822adbe6";
        hash = "sha256-4S4Bt6Fu+LWXvvdRWVqxwaCP7Q2ELAJsz0I3zGYIWvM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_servo";
  version = "2.10.0-1";
  src = sources.moveit_servo;
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
