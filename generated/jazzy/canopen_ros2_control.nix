{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  canopen_402_driver,
  canopen_core,
  canopen_proxy_driver,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware_interface,
  pluginlib,
  rclcpp,
  rclcpp_components,
  rclcpp_lifecycle,
  ros2_control_test_assets,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    canopen_ros2_control = substituteSource {
      src = fetchFromGitHub {
        name = "canopen_ros2_control-source";
        owner = "ros2-gbp";
        repo = "ros2_canopen-release";
        rev = "522659d64c9f9607958b6d52d4ea7da431e48a05";
        hash = "sha256-NGL7U94YdUR2F84u0e/YXtn2NfkFbgya9dhhCSTcpYQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "canopen_ros2_control";
  version = "0.2.9-2";
  src = sources.canopen_ros2_control;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ canopen_402_driver canopen_core canopen_proxy_driver hardware_interface pluginlib rclcpp rclcpp_components rclcpp_lifecycle ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ros2_control_test_assets ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ros2_control wrapper for ros2_canopen functionalities";
  };
}
