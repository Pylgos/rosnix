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
        rev = "0d55627857acccc1ec2a2462683ce2a1efb24508";
        hash = "sha256-jZwyK3GRuX12uQCkm5bly2ROBpQG7K3E+n16SiCRdL8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "hardware_interface_testing";
  version = "4.16.1-1";
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
