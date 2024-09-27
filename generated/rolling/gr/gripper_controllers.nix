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
  hardware_interface_testing,
  pluginlib,
  rclcpp,
  rclcpp_action,
  realtime_tools,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    gripper_controllers-eeea0d7eae538f89690b25e309941da77ca30553 = substituteSource {
      src = fetchgit {
        name = "gripper_controllers-eeea0d7eae538f89690b25e309941da77ca30553-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "eeea0d7eae538f89690b25e309941da77ca30553";
        hash = "sha256-UMxav6pRuZYG0Gkt4NNrhFwMh+zqbgoG1CK85yQV1wU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "gripper_controllers";
  version = "4.14.0-1";
  src = sources.gripper_controllers-eeea0d7eae538f89690b25e309941da77ca30553;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ backward_ros control_msgs control_toolbox controller_interface generate_parameter_library hardware_interface pluginlib rclcpp rclcpp_action realtime_tools ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface_testing ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The gripper_controllers package";
  };
}
