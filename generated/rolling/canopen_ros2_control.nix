{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  canopen_402_driver,
  canopen_core,
  canopen_proxy_driver,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  substituteSource,
}:
let
  sources = rec {
    canopen_ros2_control = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "2341a0ae43725aa0a67b7ab391caa1d7157af8fc";
        hash = "sha256-LjrXXkcJEkR96d1zppvnWDqBK2u0lNs/4YFO3rfQk5k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_ros2_control";
  version = "0.2.12-2";
  src = sources.canopen_ros2_control;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_proxy_driver hardware_interface pluginlib rclcpp rclcpp_components rclcpp_lifecycle ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ];
  missingDependencies = [  ];
  meta = {
    description = "ros2_control wrapper for ros2_canopen functionalities";
  };
}
