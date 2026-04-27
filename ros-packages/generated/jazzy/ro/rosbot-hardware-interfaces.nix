{
  ament-cmake,
  ament-cmake-gtest,
  buildAmentCmakePackage,
  diff-drive-controller,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  imu-sensor-broadcaster,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  ros2-control,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbot_hardware_interfaces";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rosbot_hardware_interfaces";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ diff-drive-controller hardware-interface imu-sensor-broadcaster pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control std-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ diff-drive-controller hardware-interface imu-sensor-broadcaster pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control std-msgs ];
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "rosbot_hardware_interfaces" = substituteSource {
      src = fetchgit {
        name = "rosbot_hardware_interfaces-source";
        url = "https://github.com/ros2-gbp/rosbot_ros-release.git";
        rev = "2c1d83cb0821a7673b89ac44ef23eb71a4619d11";
        hash = "sha256-yS1uyj0SwmeXPqbuk3mInoYP8MqOWsIcu2zjFNyMdhU=";
      };
    };
  });
  meta = {
    description = "Hardware controller for ROSbot Series";
  };
})
