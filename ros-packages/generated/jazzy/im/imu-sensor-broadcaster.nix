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
  ros2-control-test-assets,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "imu_sensor_broadcaster";
  version = "4.22.0-1";
  src = finalAttrs.passthru.sources."imu_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools sensor-msgs ];
  checkInputs = [ ament-cmake-gmock ament-lint-auto ament-lint-common controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "imu_sensor_broadcaster" = substituteSource {
      src = fetchgit {
        name = "imu_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "6f145933b0ac989b989836bd8a4a6c1a5d36d57f";
        hash = "sha256-S+ya3uUYI1H0w8JiJgluh+gApSrl0x5XhBYxLfS3HI4=";
      };
    };
  });
  meta = {
    description = "Controller to publish readings of IMU sensors.";
  };
})
