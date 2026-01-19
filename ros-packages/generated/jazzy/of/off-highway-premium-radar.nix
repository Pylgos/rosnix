{
  ament-cmake,
  ament-cmake-ros,
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
  off-highway-premium-radar-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_premium_radar";
  version = "1.1.0-1";
  src = finalAttrs.passthru.sources."off_highway_premium_radar";
  nativeBuildInputs = [ ament-cmake asio-cmake-module ];
  propagatedNativeBuildInputs = [ diagnostic-updater io-context off-highway-premium-radar-msgs rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" ]; };
  buildInputs = [ ament-cmake asio-cmake-module ];
  propagatedBuildInputs = [ diagnostic-updater io-context off-highway-premium-radar-msgs rclcpp rclcpp-components sensor-msgs std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_premium_radar" = substituteSource {
      src = fetchgit {
        name = "off_highway_premium_radar-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "52444cb02e9631afe4a406273277989d2f8e4cfd";
        hash = "sha256-vHHGzwo87z98MKF+BCM8+ajRDwf79TNUmHb2JM3bCJc=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar package";
  };
})
