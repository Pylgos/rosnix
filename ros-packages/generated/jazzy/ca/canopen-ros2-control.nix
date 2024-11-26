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
  version = "0.2.9-2";
  src = finalAttrs.passthru.sources."canopen_ros2_control";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ canopen-402-driver canopen-core canopen-proxy-driver hardware-interface pluginlib rclcpp rclcpp-components rclcpp-lifecycle ];
  checkInputs = [ ament-cmake-gmock ros2-control-test-assets ];
  passthru = {
    sources = mkSourceSet (sources: {
      "canopen_ros2_control" = substituteSource {
        src = fetchgit {
          name = "canopen_ros2_control-source";
          url = "https://github.com/ros2-gbp/ros2_canopen-release.git";
          rev = "522659d64c9f9607958b6d52d4ea7da431e48a05";
          hash = "sha256-NGL7U94YdUR2F84u0e/YXtn2NfkFbgya9dhhCSTcpYQ=";
        };
      };
    });
  };
  meta = {
    description = "ros2_control wrapper for ros2_canopen functionalities";
  };
})
