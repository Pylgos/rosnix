{
  ament-cmake,
  ament-cmake-gen-version-h,
  ament-cmake-gmock,
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
  ros2-control-cmake,
  rosSystemPackages,
  substituteSource,
  trajectory-msgs,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "joint_limits";
  version = "4.28.1-1";
  src = finalAttrs.passthru.sources."joint_limits";
  nativeBuildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedNativeBuildInputs = [ backward-ros pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake trajectory-msgs urdf ];
  buildInputs = [ ament-cmake ament-cmake-gen-version-h ];
  propagatedBuildInputs = [ backward-ros pluginlib rclcpp rclcpp-lifecycle realtime-tools ros2-control-cmake trajectory-msgs urdf ];
  checkInputs = [ ament-cmake-gmock generate-parameter-library launch-ros launch-testing-ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "joint_limits" = substituteSource {
      src = fetchgit {
        name = "joint_limits-source";
        url = "https://github.com/ros2-gbp/ros2_control-release.git";
        rev = "9583c46bfb75e260e15da88ae3ebc905b89010b9";
        hash = "sha256-nQogEgAx1YHWvWuplK06NNAWFTCPYfWYZ1A96u6YYgI=";
      };
    };
  });
  meta = {
    description = "Package with interfaces for handling of joint limits in controllers or in hardware. The package also implements Saturation Joint Limiter for position-velocity-acceleration set and other individual interfaces.";
  };
})
