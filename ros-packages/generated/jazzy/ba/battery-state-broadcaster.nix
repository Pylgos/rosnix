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
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."battery_state_broadcaster";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ controller-interface pluginlib realtime-tools sensor-msgs ];
  passthru = {
    sources = mkSourceSet (sources: {
      "battery_state_broadcaster" = substituteSource {
        src = fetchgit {
          name = "battery_state_broadcaster-source";
          url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
          rev = "e524fc46c70f55c6dc99857564279390e1291ffb";
          hash = "sha256-ynQossur/wBDAwdNLaf0DVCZVv6fkXa6OyEyCrDtoWs=";
        };
      };
    });
  };
  meta = {
    description = "ROS2 Control boradcaster for battery state sensors.";
  };
})
