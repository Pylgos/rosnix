{
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  nmea_msgs,
  python3Packages,
  rclpy,
  sensor_msgs,
  substituteSource,
  tf_transformations,
}:
let
  sources = rec {
    nmea_navsat_driver = substituteSource {
      src = fetchgit {
        name = "nmea_navsat_driver-source";
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
  src = sources.nmea_navsat_driver;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs nmea_msgs python3Packages.pyserial rclpy sensor_msgs tf_transformations ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Package to parse NMEA strings and publish a very simple GPS message. Does not require or use the GPSD deamon.";
  };
}
