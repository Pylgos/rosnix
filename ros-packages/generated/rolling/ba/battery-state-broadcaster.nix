{
  ament-cmake,
  buildAmentCmakePackage,
  controller-interface,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  realtime-tools,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "battery_state_broadcaster";
  version = "1.2.0-2";
  src = finalAttrs.passthru.sources."battery_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ controller-interface pluginlib realtime-tools sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface pluginlib realtime-tools sensor-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "battery_state_broadcaster" = substituteSource {
      src = fetchgit {
        name = "battery_state_broadcaster-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "1835a131f1f499c99d3576be59e94927441c37a9";
        hash = "sha256-70A92yD/khpnrQhZimDdebxm5NZcNx/zngFLg+RfT9k=";
      };
    };
  });
  meta = {
    description = "ROS2 Control boradcaster for battery state sensors.";
  };
})
