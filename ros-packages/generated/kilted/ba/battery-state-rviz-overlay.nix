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
  version = "1.2.0-1";
  src = finalAttrs.passthru.sources."battery_state_rviz_overlay";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rviz-2d-overlay-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "fmt" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rviz-2d-overlay-msgs sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  passthru.sources = mkSourceSet (sources: {
    "battery_state_rviz_overlay" = substituteSource {
      src = fetchgit {
        name = "battery_state_rviz_overlay-source";
        url = "https://github.com/ros2-gbp/ros_battery_monitoring-release.git";
        rev = "0f5044fc676d9bd4b42a8f76f660ed3ef1487fe1";
        hash = "sha256-t7Lb0pissj1Ur78lP0zLlIcJH+MFyoTVZ7EusTzphCk=";
      };
    };
  });
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
})
