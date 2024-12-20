{
  ament-cmake,
  ament-cmake-gmock,
  backward-ros,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  geometry-msgs,
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "force_torque_sensor_broadcaster";
  version = "4.18.0-1";
  src = finalAttrs.passthru.sources."force_torque_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "force_torque_sensor_broadcaster" = substituteSource {
      src = fetchgit {
        name = "force_torque_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "157d8b124fb82ce6f6acbaf143c4e36a8a8dfafb";
        hash = "sha256-D1XJDqiGUbhwtbPDPgZJjcXnXt+jwcRC9m8pin51/aI=";
      };
    };
  });
  meta = {
    description = "Controller to publish state of force-torque sensors.";
  };
})
