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
  version = "5.4.0-1";
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
        rev = "2c09e734df6ba7a88efc5f4b2416ae0fb0fe1f90";
        hash = "sha256-SG9Kwy6NGnj/xL0skxtsCHIxcu/0syxt8xnjLbaLNKc=";
      };
    };
  });
  meta = {
    description = "Controller to publish state of force-torque sensors.";
  };
})
