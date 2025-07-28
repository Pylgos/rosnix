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
  ros2-control-cmake,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "force_torque_sensor_broadcaster";
  version = "4.29.0-1";
  src = finalAttrs.passthru.sources."force_torque_sensor_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ backward-ros controller-interface generate-parameter-library geometry-msgs hardware-interface pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake ];
  checkInputs = [ ament-cmake-gmock controller-manager hardware-interface-testing ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "force_torque_sensor_broadcaster" = substituteSource {
      src = fetchgit {
        name = "force_torque_sensor_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "046e38d6c847538c714e26c1193d37566c7ef4f1";
        hash = "sha256-xFTIoioIZXtjnxYrmG4I50Cucjsk8szK693O6oxxqnM=";
      };
    };
  });
  meta = {
    description = "Controller to publish state of force-torque sensors.";
  };
})
