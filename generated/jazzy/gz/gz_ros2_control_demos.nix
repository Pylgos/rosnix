{
  ackermann_steering_controller,
  ament_cmake,
  ament_cmake_gtest,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  control_msgs,
  diff_drive_controller,
  effort_controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  gz_ros2_control,
  hardware_interface,
  imu_sensor_broadcaster,
  joint_state_broadcaster,
  joint_trajectory_controller,
  launch,
  launch_ros,
  rclcpp,
  rclcpp_action,
  robot_state_publisher,
  ros2controlcli,
  ros2launch,
  rosSystemPackages,
  ros_gz_bridge,
  ros_gz_sim,
  std_msgs,
  substituteSource,
  tricycle_controller,
  velocity_controllers,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    gz_ros2_control_demos = substituteSource {
      src = fetchgit {
        name = "gz_ros2_control_demos-source";
        url = "https://github.com/ros2-gbp/ign_ros2_control-release.git";
        rev = "f25fb245c3d154f807efd2bfbf815195e30e9bde";
        hash = "sha256-oFa8pMwGaxu4uTVmOWL6709Mg3uGcSBFP03qzNgFaYE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control_demos";
  version = "1.2.7-1";
  src = sources.gz_ros2_control_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ackermann_steering_controller ament_index_python control_msgs diff_drive_controller effort_controllers geometry_msgs gz_ros2_control hardware_interface imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller launch launch_ros rclcpp rclcpp_action robot_state_publisher ros2controlcli ros2launch ros_gz_bridge ros_gz_sim std_msgs tricycle_controller velocity_controllers xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "gz_ros2_control_demos";
  };
}
