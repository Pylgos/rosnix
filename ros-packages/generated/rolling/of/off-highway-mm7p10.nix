{
  ament-cmake,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  can-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  off-highway-can,
  off-highway-mm7p10-msgs,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "off_highway_mm7p10";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."off_highway_mm7p10";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ can-msgs off-highway-can off-highway-mm7p10-msgs rclcpp rclcpp-components sensor-msgs tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ can-msgs off-highway-can off-highway-mm7p10-msgs rclcpp rclcpp-components sensor-msgs tf2 ];
  checkInputs = [ ament-cmake-ros ament-lint-auto ament-lint-common tf2-geometry-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "off_highway_mm7p10" = substituteSource {
      src = fetchgit {
        name = "off_highway_mm7p10-source";
        url = "https://github.com/ros2-gbp/off_highway_sensor_drivers-release.git";
        rev = "74a4c571d6e3b0780b522830e9ff9215bf81486e";
        hash = "sha256-JCMbbOZ2N7qweKSiIAwdaeODZnsJu4/w2XbKVnyUGS0=";
      };
    };
  });
  meta = {
    description = "The off_highway_mm7p10 package";
  };
})
