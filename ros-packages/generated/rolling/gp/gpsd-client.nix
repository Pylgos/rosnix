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
  version = "2.0.5-1";
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
        rev = "620c5a9ede4a9e50b97a23c05d4515de70ac48e3";
        hash = "sha256-c1PDOcIpVRapwGLgAPbbtuxNN07oIT5/iiEjDmpT2R4=";
      };
    };
  });
  meta = {
    description = "connects to a GPSd server and broadcasts GPS fixes \n   using the NavSatFix message";
  };
})
