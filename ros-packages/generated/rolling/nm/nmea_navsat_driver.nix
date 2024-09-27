{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  mkSourceSet,
  nmea_msgs,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf_transformations,
}:
let
  sources = mkSourceSet (sources: {
    "nmea_navsat_driver" = substituteSource {
      src = fetchgit {
        name = "nmea_navsat_driver-source";
        url = "https://github.com/ros2-gbp/nmea_navsat_driver-release.git";
        rev = "2dadf09b62ddc47adf7c9e60794c05308bf996d9";
        hash = "sha256-Sk5PVLiGhnZlswzI74j4DqsxsA7icXEWu6Wb6JlbN4s=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "nmea_navsat_driver";
  version = "2.0.1-2";
  src = sources."nmea_navsat_driver";
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nmea_msgs rclpy sensor_msgs tf_transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-serial" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package to parse NMEA strings and publish a very simple GPS message. Does not require or use the GPSD deamon.";
  };
}
