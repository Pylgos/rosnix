{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  control_msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  lifecycle_msgs,
  pluginlib,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    hardware_interface_testing = substituteSource {
      src = fetchgit {
        name = "hardware_interface_testing-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "b2d64bf088aff2569bdb4234bed8d8f1743c3ed4";
        hash = "sha256-ERq3EYu8vKsZcSV8lzb5q3VVeEYjJp1sAIGWfu5lPoI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface_testing";
  version = "4.15.0-1";
  src = sources.hardware_interface_testing;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ control_msgs hardware_interface lifecycle_msgs pluginlib rclcpp_lifecycle ros2_control_test_assets ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ];
  missingDependencies = [  ];
  meta = {
    description = "ros2_control hardware interface testing";
  };
}
