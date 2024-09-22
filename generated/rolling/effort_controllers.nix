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
    effort_controllers = substituteSource {
      src = fetchgit {
        name = "effort_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "3c5b6884ed74d4e314ad046821558050c54144df";
        hash = "sha256-pCxBjbRTUphp1LsQePLlukEF+8bNUxLq93XugUd/ZuI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "effort_controllers";
  version = "4.14.0-1";
  src = sources.effort_controllers;
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
