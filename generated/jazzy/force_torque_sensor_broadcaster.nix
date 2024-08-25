{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    force_torque_sensor_broadcaster = substituteSource {
      src = fetchgit {
        name = "force_torque_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "2af3db59b349f51b0f5ca6d7b3c1ae85f3b2c780";
        hash = "sha256-iRGjt7Z18HvFjZQPJAaW/okdxu2Eu3cdN5CjXQZT5pY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "force_torque_sensor_broadcaster";
  version = "4.12.1-1";
  src = sources.force_torque_sensor_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros controller_interface generate_parameter_library geometry_msgs hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Controller to publish state of force-torque sensors.";
  };
}
