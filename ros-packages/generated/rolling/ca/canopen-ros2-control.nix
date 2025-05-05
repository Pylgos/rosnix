{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  canopen-402-driver,
  canopen-core,
  canopen-proxy-driver,
  fetchgit,
  fetchurl,
  fetchzip,
  hardware-interface,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  ros2-control-test-assets,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "canopen_ros2_control";
  version = "0.3.0-1";
  src = finalAttrs.passthru.sources."canopen_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ canopen-402-driver canopen-core canopen-proxy-driver hardware-interface pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-core canopen-proxy-driver hardware-interface pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru.sources = mkSourceSet (sources: {
    "canopen_ros2_control" = substituteSource {
      src = fetchgit {
        name = "canopen_ros2_control-source";
        url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
        rev = "29d696560d474f5092ad5080d76a2c566691893b";
        hash = "sha256-+oQp1xp+Ib/E+0YXaSwOsBQl8YmC1Rer4MrTKBM2/ts=";
      };
    };
  });
  meta = {
    description = "ros2_control wrapper for ros2_canopen functionalities";
  };
})
