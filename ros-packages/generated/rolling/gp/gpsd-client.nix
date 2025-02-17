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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."gpsd_client";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ gps-msgs rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgps" ]; };
  passthru.sources = mkSourceSet (sources: {
    "gpsd_client" = substituteSource {
      src = fetchgit {
        name = "gpsd_client-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "3f85c0bfc8f40ef1245070b81463ab4b3184ffa2";
        hash = "sha256-Ssq5pihtdqJuy//6IfxXwaJCV1EC4X7urzYBOcONtjQ=";
      };
    };
  });
  meta = {
    description = "connects to a GPSd server and broadcasts GPS fixes using the NavSatFix message";
  };
})
