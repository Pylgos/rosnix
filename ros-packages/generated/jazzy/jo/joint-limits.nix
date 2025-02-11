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
  version = "4.26.0-1";
  src = finalAttrs.passthru.sources."joint_limits";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros pluginlib rclcpp rclcpp-lifecycle realtime-tools trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest generate-parameter-library launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "joint_limits" = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "c12027f3ea5fdfccd6bc5e9432a63a8026017fec";
        hash = "sha256-zOzfzl/5p0fVMN09GLGLyYIDsEXQo9CJMSaNuV6pV1s=";
      };
    };
  });
  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
  };
})
