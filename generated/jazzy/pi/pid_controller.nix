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
  rosSystemPackages,
  std_srvs,
  substituteSource,
}:
let
  sources = rec {
    pid_controller-316768761d9d7ef7def837cfc80ab1de94e220d4 = substituteSource {
      src = fetchgit {
        name = "pid_controller-316768761d9d7ef7def837cfc80ab1de94e220d4-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "316768761d9d7ef7def837cfc80ab1de94e220d4";
        hash = "sha256-Z29YqPUQRvie95gO84fkVUaUmk5AzKMFhJuIsGHICtA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pid_controller";
  version = "4.14.0-1";
  src = sources.pid_controller-316768761d9d7ef7def837cfc80ab1de94e220d4;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ angles backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface parameter_traits pluginlib rclcpp rclcpp_lifecycle realtime_tools std_srvs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Controller based on PID implememenation from control_toolbox package.";
  };
}
