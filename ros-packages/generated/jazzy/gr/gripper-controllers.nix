{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  control-msgs,
  control-toolbox,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-action,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gripper_controllers";
  version = "4.38.0-1";
  src = finalAttrs.passthru.sources."gripper_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros control-msgs control-toolbox controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-action realtime-tools ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "gripper_controllers" = substituteSource {
      src = fetchgit {
        name = "gripper_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "43f86e62dae6bd3b24d8658b060f4590c42eebe6";
        hash = "sha256-MgWZ1UcrV5S6xZquVOrLKp0mBOiZ4yXRXLRQwoQyvp0=";
      };
    };
  });
  meta = {
    description = "The gripper_controllers package";
  };
})
