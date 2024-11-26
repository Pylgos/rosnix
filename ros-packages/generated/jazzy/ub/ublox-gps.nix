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
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  ublox-msgs,
  ublox-serialization,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ublox_gps";
  version = "2.3.0-4";
  src = finalAttrs.passthru.sources."ublox_gps";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ diagnostic-msgs diagnostic-updater geometry-msgs rcl-interfaces rclcpp rclcpp-components sensor-msgs std-msgs tf2 ublox-msgs ublox-serialization ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "asio" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ublox_gps" = substituteSource {
        src = fetchgit {
          name = "ublox_gps-source";
          url = "https://github.com/ros2-gbp/ublox-release.git";
          rev = "f5d7776b5a2919a6764491726d07c5370b2488a2";
          hash = "sha256-reZXChxPuNCtJNjWaATs7ozW63ldzYenGz4KQv8rJ1M=";
        };
      };
    });
  };
  meta = {
    description = "Driver for u-blox GPS devices.";
  };
})
