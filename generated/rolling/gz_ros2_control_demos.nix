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
        rev = "3c9491a7c86d1b0ff993e864f58f6c690e34868e";
        hash = "sha256-ACb0esOTiy9I3ic+17gSrVBMe/CWyNFsau1LwFfaoQg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gz_ros2_control_demos";
  version = "2.0.0-3";
  src = sources.gz_ros2_control_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ackermann_steering_controller ament_index_python control_msgs diff_drive_controller effort_controllers geometry_msgs gz_ros2_control hardware_interface imu_sensor_broadcaster joint_state_broadcaster joint_trajectory_controller launch launch_ros rclcpp rclcpp_action robot_state_publisher ros2controlcli ros2launch ros_gz_bridge ros_gz_sim std_msgs tricycle_controller velocity_controllers xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "gz_ros2_control_demos";
  };
}
