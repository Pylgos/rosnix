{
  ament_cmake,
  ament_cmake_gmock,
  ament_lint_auto,
  ament_lint_common,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  sensor_msgs,
  substituteSource,
}:
let
  sources = rec {
    imu_sensor_broadcaster = substituteSource {
      src = fetchgit {
        name = "imu_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f23746fbe8efc1cb44927ac6325f2968ddf180c2";
        hash = "sha256-5Eho0MEiWu+Dbgz9ss7r0ddaS0CAYGpIsOXO0qZQsNg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "imu_sensor_broadcaster";
  version = "4.13.0-1";
  src = sources.imu_sensor_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools sensor_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ament_lint_auto ament_lint_common controller_manager hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Controller to publish readings of IMU sensors.";
  };
}
