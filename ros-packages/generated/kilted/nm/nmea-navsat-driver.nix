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
  propagatedNativeBuildInputs = [ geometry-msgs nmea-msgs rclpy sensor-msgs tf-transformations ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-serial" ]; };
  propagatedBuildInputs = [ geometry-msgs nmea-msgs rclpy sensor-msgs tf-transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-serial" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "nmea_navsat_driver" = substituteSource {
      src = fetchgit {
        name = "nmea_navsat_driver-source";
        url = "https://github.com/ros2-gbp/nmea_navsat_driver-release.git";
        rev = "b15d2cec3124c59659d547936c3970ddd025589b";
        hash = "sha256-Sk5PVLiGhnZlswzI74j4DqsxsA7icXEWu6Wb6JlbN4s=";
      };
    };
  });
  meta = {
    description = "\n        Package to parse NMEA strings and publish a very simple GPS message. Does not\n        require or use the GPSD deamon.\n    ";
  };
})
