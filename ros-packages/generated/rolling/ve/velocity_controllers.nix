{
  ament_cmake,
  ament_cmake_gmock,
  backward_ros,
  buildRosPackage,
  controller_manager,
  fetchgit,
  fetchurl,
  fetchzip,
  forward_command_controller,
  hardware_interface,
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    velocity_controllers-a9636cd4a75bc98ac3ea53438ee5fd66e8a2ff61 = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-a9636cd4a75bc98ac3ea53438ee5fd66e8a2ff61-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "a9636cd4a75bc98ac3ea53438ee5fd66e8a2ff61";
        hash = "sha256-PWviUVk+O8BPR1IjaQ7q0K8dZueuBJMGfPjJuuh2ohg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "4.14.0-1";
  src = sources.velocity_controllers-a9636cd4a75bc98ac3ea53438ee5fd66e8a2ff61;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generic controller for forwarding commands.";
  };
}
