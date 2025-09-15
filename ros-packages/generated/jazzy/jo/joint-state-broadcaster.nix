{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  control-msgs,
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
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_state_broadcaster";
  version = "4.32.0-1";
  src = finalAttrs.passthru.sources."joint_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs urdf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "joint_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "joint_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d4d0e1aec8ca032689c507ebacfc9cd3f7954805";
        hash = "sha256-J5RxAsVDcz8pX+dDMMVSy0HWImUCw77Am2qryamO0sk=";
      };
    };
  });
  meta = {
    description = "Broadcaster to publish joint state";
  };
})
