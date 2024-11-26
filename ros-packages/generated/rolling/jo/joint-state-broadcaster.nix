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
  rcutils,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_state_broadcaster";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."joint_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros builtin-interfaces control-msgs controller-interface generate-parameter-library pluginlib rclcpp-lifecycle rcutils realtime-tools sensor-msgs urdf ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface hardware-interface-testing rclcpp ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "joint_state_broadcaster" = substituteSource {
        src = fetchgit {
          name = "joint_state_broadcaster-source";
          url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
          rev = "35f5336000e9b295eb70f651195714b737e308a6";
          hash = "sha256-GV18pB63Xo1P6n1sE/at1i7hVW029GyHiPcm2w9G7fY=";
        };
      };
    });
  };
  meta = {
    description = "Broadcaster to publish joint state";
  };
})
