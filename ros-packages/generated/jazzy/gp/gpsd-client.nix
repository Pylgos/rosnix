{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gpsd_client";
  version = "2.1.2-1";
  src = finalAttrs.passthru.sources."gpsd_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gps-msgs rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgps" "pkg-config" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gps-msgs rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgps" "pkg-config" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gpsd_client" = substituteSource {
      src = fetchgit {
        name = "gpsd_client-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "41e374a28e160e2950568ab20809d5070992f0cc";
        hash = "sha256-p203CqjmPg6IJ82Ci8Iy5RgPjHATrrGkFb3nwJ6qGDs=";
      };
    };
  });
  meta = {
    description = "connects to a GPSd server and broadcasts GPS fixes \n   using the NavSatFix message";
  };
})
