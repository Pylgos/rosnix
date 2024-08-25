{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  builtin_interfaces,
  control_msgs,
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
  rcutils,
  realtime_tools,
  ros2_control_test_assets,
  sensor_msgs,
  substituteSource,
  urdf,
}:
let
  sources = rec {
    joint_state_broadcaster = substituteSource {
      src = fetchgit {
        name = "joint_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "614a31ed2dbd829f230b468ae5e02550748d8ff0";
        hash = "sha256-ClsZn7lMqG3n6M+PugoRxmTEaUvrJBA+Z9D9f0C8mlQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_state_broadcaster";
  version = "4.13.0-1";
  src = sources.joint_state_broadcaster;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros builtin_interfaces control_msgs controller_interface generate_parameter_library pluginlib rclcpp_lifecycle rcutils realtime_tools sensor_msgs urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface hardware_interface_testing rclcpp ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Broadcaster to publish joint state";
  };
}
