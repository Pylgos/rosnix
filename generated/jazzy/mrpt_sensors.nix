{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mrpt_generic_sensor,
  mrpt_sensor_bumblebee_stereo,
  mrpt_sensor_gnss_nmea,
  mrpt_sensor_gnss_novatel,
  mrpt_sensor_imu_taobotics,
  mrpt_sensorlib,
  substituteSource,
}:
let
  sources = rec {
    mrpt_sensors = substituteSource {
      src = fetchgit {
        name = "mrpt_sensors-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "9e10cc4c2cc6e3f98af89c0abd17fbd554efa078";
        hash = "sha256-f0Gj0v5KZWHX/4j9MPoiyccJ04+ozBhns3us+61llMc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensors";
  version = "0.2.2-1";
  src = sources.mrpt_sensors;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ];
  buildInputs = [  ];
  propagatedBuildInputs = [ mrpt_generic_sensor mrpt_sensor_bumblebee_stereo mrpt_sensor_gnss_nmea mrpt_sensor_gnss_novatel mrpt_sensor_imu_taobotics mrpt_sensorlib ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS nodes for various robotics sensors via mrpt-hwdrivers. Metapackage for all mrpt_sensor packages.";
  };
}
