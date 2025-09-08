{
  ament-cmake,
  ament-cmake-gmock,
  ament-lint-auto,
  ament-lint-common,
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
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_sensor_broadcaster";
  version = "5.6.1-1";
  src = finalAttrs.passthru.sources."imu_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common controller-manager hardware-interface-testing ros2-control-test-assets tf2 tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "imu_sensor_broadcaster" = substituteSource {
      src = fetchgit {
        name = "imu_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "564f869ab516850f4331fe972b9cdf542dae4560";
        hash = "sha256-8aIUL+3Oe2h3IYpnHaLUgMyo9E504JTR6srJ1IL2H8U=";
      };
    };
  });
  meta = {
    description = "Controller to publish readings of IMU sensors.";
  };
})
