{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  asio-cmake-module,
  buildAmentCmakePackage,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  io-context,
  mkSourceSet,
  off-highway-premium-radar-sample-msgs,
  pcl-conversions,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_premium_radar_sample";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."off_highway_premium_radar_sample";
  nativeBuildInputs = [ ament-cmake asio-cmake-module ];
  propagatedNativeBuildInputs = [ diagnostic-updater io-context off-highway-premium-radar-sample-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" "libpcl-all-dev" "libpcl-common" ]; };
  buildInputs = [ ament-cmake asio-cmake-module ];
  propagatedBuildInputs = [ diagnostic-updater io-context off-highway-premium-radar-sample-msgs pcl-conversions rclcpp rclcpp-components sensor-msgs std-msgs tf2 tf2-geometry-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" "libpcl-all-dev" "libpcl-common" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar_sample" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar_sample-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "769f862705b324876ed1a57936acb1640f0735b1";
        hash = "sha256-p07RJDw3Z9rueHnfA9BEiHJMoFjosyKH003gN2z1hB4=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar_sample package";
  };
})
