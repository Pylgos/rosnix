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
        rev = "ded509f547c0e8b4b2d2d020474c868205c11964";
        hash = "sha256-8f1zNa/mGPpBtyGqYMveRa39YKux9+lQ0wUBSs3hZPU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "parallel_gripper_controller";
  version = "4.12.1-1";
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
