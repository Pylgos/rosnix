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
  version = "1.0.0-1";
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
        rev = "78668a797d4bbd05775fe7e999de27076c681cb7";
        hash = "sha256-hE1HmeVZKS4G4+aaq7CbezHXZXz8rNrhQB6aoXjCYOc=";
      };
    };
  });
  meta = {
    description = "The off_highway_premium_radar package";
  };
})
