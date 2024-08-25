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
  parameter_traits,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  realtime_tools,
  ros2_control_test_assets,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    pid_controller = substituteSource {
      src = fetchgit {
        name = "pid_controller-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "ee8724caa691b10718b9a0181ce0f56384c224d4";
        hash = "sha256-Fp7WiqA8VPtNOxIMelGHa+aDr36kpr9JrKODoGp8GhU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pid_controller";
  version = "4.12.1-1";
  src = sources.pid_controller;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface parameter_traits pluginlib rclcpp rclcpp_lifecycle realtime_tools std_srvs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
}
