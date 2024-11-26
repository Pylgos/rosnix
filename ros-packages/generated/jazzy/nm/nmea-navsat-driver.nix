{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nmea-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf-transformations,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "nmea_navsat_driver";
  version = "2.0.1-3";
  src = finalAttrs.passthru.sources."nmea_navsat_driver";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ geometry-msgs nmea-msgs rclpy sensor-msgs tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "nmea_navsat_driver" = substituteSource {
        src = fetchgit {
          name = "nmea_navsat_driver-source";
          url = "https://github.com/ros2-gbp/nmea_navsat_driver-release.git";
          rev = "653584d333ea4290927125ab49c0927c52fe2c4b";
          hash = "sha256-Sk5PVLiGhnZlswzI74j4DqsxsA7icXEWu6Wb6JlbN4s=";
        };
      };
    });
  };
  meta = {
    description = "Package to parse NMEA strings and publish a very simple GPS message. Does not require or use the GPSD deamon.";
  };
})
