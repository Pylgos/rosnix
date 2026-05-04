{
  ament-cmake-ros,
  buildAmentCmakePackage,
  diagnostic-msgs,
  diagnostic-updater,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nmea-msgs,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rtcm-msgs,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  ublox-msgs,
  ublox-serialization,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_gps";
  version = "3.0.0-2";
  src = finalAttrs.passthru.sources."ublox_gps";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nmea-msgs rcl-interfaces rclcpp rclcpp-components rtcm-msgs sensor-msgs std-msgs tf2 ublox-msgs ublox-serialization ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "asio" ]; };
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs nmea-msgs rcl-interfaces rclcpp rclcpp-components rtcm-msgs sensor-msgs std-msgs tf2 ublox-msgs ublox-serialization ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ublox_gps" = substituteSource {
      src = fetchgit {
        name = "ublox_gps-source";
        url = "https://github.com/ros2-gbp/ublox-release.git";
        rev = "791ebf1a92bfc17c59f30d1339a5085b910e57b7";
        hash = "sha256-eV9pb+WnJCBTQVNM8mR1VL7ul3QOqKwyrtoBaR5OrFA=";
      };
    };
  });
  meta = {
    description = "\n     Driver for u-blox GPS devices.\n  ";
  };
})
