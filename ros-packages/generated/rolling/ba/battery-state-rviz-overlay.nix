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
  version = "1.0.2-1";
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
        rev = "6ff67636cf6c2465f28062c0624d3301ef5c0711";
        hash = "sha256-4eH9L1LQAZsFQl5FJsugrBDRPnLXu1EsH+LANvq1j5Q=";
      };
    };
  });
  meta = {
    description = "Converts BatteryState messages to RViz OverlayText messages.";
  };
})
