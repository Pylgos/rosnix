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
  version = "1.0.1-1";
  src = finalAttrs.passthru.sources."battery_state_rviz_overlay";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rviz-2d-overlay-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "battery_state_rviz_overlay" = substituteSource {
      src = fetchgit {
        name = "battery_state_rviz_overlay-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "f86fc58c306eecee63212d52599e0418d0292e72";
        hash = "sha256-QNV2hwmneAK0X9LrwihDpvvg7eMXaUgScqpUDLZtVqM=";
      };
    };
  });
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
})
