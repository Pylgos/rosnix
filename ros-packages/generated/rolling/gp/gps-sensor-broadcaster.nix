{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  controller-interface,
  controller-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  hardware-interface,
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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gps_sensor_broadcaster";
  version = "6.6.0-1";
  src = finalAttrs.passthru.sources."gps_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ];
  checkInputs = [ ament-cmake-gmock controller-manager ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "gps_sensor_broadcaster" = substituteSource {
      src = fetchgit {
        name = "gps_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f6d8fb23914439a4f5e66f615357602a8a3cc0a1";
        hash = "sha256-S6Vif1XSeFLbaX27da/rht1Qt+C0RI2yLZcl8nOHlVE=";
      };
    };
  });
  meta = {
    description = "Controller to publish readings of GPS sensors.";
  };
})
