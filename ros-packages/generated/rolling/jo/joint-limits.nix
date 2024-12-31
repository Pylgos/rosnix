{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
  ament-cmake-gtest,
  backward-ros,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  launch-ros,
  launch-testing-ament-cmake,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  realtime-tools,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_limits";
  version = "4.23.0-1";
  src = finalAttrs.passthru.sources."joint_limits";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros pluginlib rclcpp rclcpp-lifecycle realtime-tools trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest generate-parameter-library launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "joint_limits" = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "9cea04176a5aeb5068468775bef79d1b6e032226";
        hash = "sha256-muzLmamLH2A+tNWoJCVStfbvEj8jk0PNgK17t0qNRgI=";
      };
    };
  });
  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
  };
})
