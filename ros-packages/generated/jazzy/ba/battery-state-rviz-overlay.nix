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
  passthru.sources = mkSourceSet (sources: {
    "battery_state_rviz_overlay" = substituteSource {
      src = fetchgit {
        name = "battery_state_rviz_overlay-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "83b60b8f64fc00ca4d63b6f7136ca1c65ea1f4b2";
        hash = "sha256-A61MKRfgwWoXT2grhLyskRsZlX0jDeFHTt4+Vl4eu4s=";
      };
    };
  });
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
})
