{
  ament_cmake,
  ament_cmake_gmock,
  angles,
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
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  rsl,
  substituteSource,
  tl_expected,
  trajectory_msgs,
  urdf,
}:
let
  sources = rec {
    joint_trajectory_controller = substituteSource {
      src = fetchgit {
        name = "joint_trajectory_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "feb5d53a0fb9f1a550b666c15cf7dbc2e8243bbb";
        hash = "sha256-/zxk1PloER19gGhmDncOXlDr39PqevpVY38eTk82Cng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "joint_trajectory_controller";
  version = "4.13.0-1";
  src = sources.joint_trajectory_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_lifecycle realtime_tools rsl tl_expected trajectory_msgs urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Controller for executing joint-space trajectories on a group of joints";
  };
}
