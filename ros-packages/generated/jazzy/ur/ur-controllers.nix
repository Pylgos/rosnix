{
  action-msgs,
  ament-cmake,
  angles,
  buildAmentCmakePackage,
  control-msgs,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  tf2-geometry-msgs,
  tf2-ros,
  trajectory-msgs,
  ur-dashboard-msgs,
  ur-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ur_controllers";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."ur_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ action-msgs angles control-msgs controller-interface geometry-msgs joint-trajectory-controller lifecycle-msgs pluginlib rclcpp-lifecycle rcutils realtime-tools std-msgs std-srvs tf2-geometry-msgs tf2-ros trajectory-msgs ur-dashboard-msgs ur-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "ur_controllers" = substituteSource {
      src = fetchgit {
        name = "ur_controllers-source";
        url = "https://github.com/ros2-gbp/Universal_Robots_ROS2_Driver-release.git";
        rev = "63b9df0c4f6d7299aebe0607b904af1e54821e93";
        hash = "sha256-4cj+QRm3B9nZ4UWrHkazqghHdP+qS4ZOmNn0nQjAmEs=";
      };
    };
  });
  meta = {
    description = "Provides controllers that use the speed scaling interface of Universal Robots.";
  };
})
