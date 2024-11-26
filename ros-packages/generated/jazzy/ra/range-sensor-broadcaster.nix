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
  hardware-interface,
  hardware-interface-testing,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "range_sensor_broadcaster";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."range_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "range_sensor_broadcaster" = substituteSource {
        src = fetchgit {
          name = "range_sensor_broadcaster-source";
          url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
          rev = "4ca8ef67c3cc629155f99d71d08e91cbb7499087";
          hash = "sha256-+7JBZLW9i4jRedL8sla0vZlUXP8uf0j9eCfoNeNWP7U=";
        };
      };
    });
  };
  meta = {
    description = "Controller to publish readings of Range sensors.";
  };
})
