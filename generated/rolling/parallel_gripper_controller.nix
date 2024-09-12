{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  control_msgs,
  control_toolbox,
  controller_interface,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_action,
  realtime_tools,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    parallel_gripper_controller = substituteSource {
      src = fetchgit {
        name = "parallel_gripper_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "5888ed8b0f5dab1a3e4a8b52ae67673a51df4a66";
        hash = "sha256-EDvM4qiyO5pkqdi1E8pUDdrcV9kVtii4LrBUrpPxsSg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "parallel_gripper_controller";
  version = "4.14.0-1";
  src = sources.parallel_gripper_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_action realtime_tools ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "The parallel_gripper_controller package";
  };
}
