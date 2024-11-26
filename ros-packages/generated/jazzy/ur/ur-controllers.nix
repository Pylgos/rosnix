{
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  joint-trajectory-controller,
  lifecycle-msgs,
  mkSourceSet,
  pluginlib,
  rclcpp-lifecycle,
  rcutils,
  realtime-tools,
  rosSystemPackages,
  std-msgs,
  std-srvs,
  substituteSource,
  ur-dashboard-msgs,
  ur-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_controllers";
  version = "2.4.13-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles controller-interface joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs ur-dashboard-msgs ur-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ur_controllers" = substituteSource {
        src = fetchgit {
          name = "ur_controllers-source";
          url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
          rev = "f0b4e470166ef612b1f8d8f8d9972687971ef413";
          hash = "sha256-+4XuYhZlvOk9vhy4Fu8mTLlsAYXwdEuNBAGy+l3c4tk=";
        };
      };
    });
  };
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
