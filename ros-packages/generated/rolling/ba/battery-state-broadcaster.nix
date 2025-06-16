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
  version = "1.0.2-1";
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
        rev = "1306b05795016f684a887462087e881efc99a8ea";
        hash = "sha256-WIoF0GiFesU+6VbF+SZGvi/6n0UTfhEq5bFuYPwpzNA=";
      };
    };
  });
  meta = {
    description = "ROS2 Control boradcaster for battery state sensors.";
  };
})
