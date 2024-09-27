{
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nmea_msgs,
  rclpy,
  rosSystemPackages,
  sensor_msgs,
  substituteSource,
  tf_transformations,
}:
let
  sources = rec {
    nmea_navsat_driver-653584d333ea4290927125ab49c0927c52fe2c4b = substituteSource {
      src = fetchgit {
        name = "nmea_navsat_driver-653584d333ea4290927125ab49c0927c52fe2c4b-source";
        url = "https://github.com/ros2-gbp/nmea_navsat_driver-release.git";
        rev = "653584d333ea4290927125ab49c0927c52fe2c4b";
        hash = "sha256-Sk5PVLiGhnZlswzI74j4DqsxsA7icXEWu6Wb6JlbN4s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nmea_navsat_driver";
  version = "2.0.1-3";
  src = sources.nmea_navsat_driver-653584d333ea4290927125ab49c0927c52fe2c4b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs nmea_msgs rclpy sensor_msgs tf_transformations ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-serial" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package to parse NMEA strings and publish a very simple GPS message. Does not require or use the GPSD deamon.";
  };
}
