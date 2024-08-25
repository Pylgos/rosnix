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
        rev = "5d0400971f3d5dcc32176a478924d9d5b7f0bcb1";
        hash = "sha256-n1LVE3Vdr04ZouVPg4WdGCiFS740o2Y35AVpLpBtUeI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "parallel_gripper_controller";
  version = "4.13.0-1";
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
