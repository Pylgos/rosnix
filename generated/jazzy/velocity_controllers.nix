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
  substituteSource,
}:
let
  sources = rec {
    velocity_controllers = substituteSource {
      src = fetchgit {
        name = "velocity_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "b75d2bcdae1a6a80e9dfb6455cbff300cdbd6a4f";
        hash = "sha256-ErbaUoA+7LFMR5CPGuDCkovb3UpK7VyKxD1JnoHoGsU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "velocity_controllers";
  version = "4.12.1-1";
  src = sources.velocity_controllers;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ backward_ros forward_command_controller pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock controller_manager hardware_interface hardware_interface_testing ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "Generic controller for forwarding commands.";
  };
}
