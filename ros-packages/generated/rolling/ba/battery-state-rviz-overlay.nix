{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-2d-overlay-msgs,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "battery_state_rviz_overlay";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."battery_state_rviz_overlay";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rviz-2d-overlay-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "battery_state_rviz_overlay" = substituteSource {
        src = fetchgit {
          name = "battery_state_rviz_overlay-source";
          url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
          rev = "3440c215e463be37cb5f6c309babe8089d2d2151";
          hash = "sha256-A61MKRfgwWoXT2grhLyskRsZlX0jDeFHTt4+Vl4eu4s=";
        };
      };
    });
  };
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
})
