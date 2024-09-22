{
  ament_cmake,
  ament_cmake_python,
  backward_ros,
  buildRosPackage,
  controller_manager,
  controller_manager_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  force_torque_sensor_broadcaster,
  geometry_msgs,
  hardware_interface,
  joint_state_broadcaster,
  joint_state_publisher,
  joint_trajectory_controller,
  launch,
  launch_ros,
  launch_testing_ament_cmake,
  pluginlib,
  position_controllers,
  rclcpp,
  rclcpp_lifecycle,
  rclpy,
  robot_state_publisher,
  ros2_controllers_test_nodes,
  rosSystemPackages,
  rviz2,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2_geometry_msgs,
  ur_client_library,
  ur_controllers,
  ur_dashboard_msgs,
  ur_description,
  ur_msgs,
  urdf,
  velocity_controllers,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    ur_robot_driver = substituteSource {
      src = fetchgit {
        name = "ur_robot_driver-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "099fe0693a6664befe9f3c3824d32ca37f5615e4";
        hash = "sha256-mJ7a9PTlrO5EdPL530/dPZX5cVmd+ht/6uVaVPLQgjU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ur_robot_driver";
  version = "2.4.10-1";
  src = sources.ur_robot_driver;
  nativeBuildInputs = [ ament_cmake ament_cmake_python wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros controller_manager controller_manager_msgs force_torque_sensor_broadcaster geometry_msgs hardware_interface joint_state_broadcaster joint_state_publisher joint_trajectory_controller launch launch_ros pluginlib position_controllers rclcpp rclcpp_lifecycle rclpy robot_state_publisher ros2_controllers_test_nodes rviz2 std_msgs std_srvs tf2_geometry_msgs ur_client_library ur_controllers ur_dashboard_msgs ur_description ur_msgs urdf velocity_controllers xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "socat" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ launch_testing_ament_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The new driver for Universal Robots UR3, UR5 and UR10 robots with CB3 controllers and the e-series.";
  };
}
