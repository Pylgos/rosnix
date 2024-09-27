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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    mrpt_sensors-eb972a441598acf641fa65ee8b919e6fb82e409b = substituteSource {
      src = fetchgit {
        name = "mrpt_sensors-eb972a441598acf641fa65ee8b919e6fb82e409b-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "eb972a441598acf641fa65ee8b919e6fb82e409b";
        hash = "sha256-B8MCdYv31gBZx0BxHHZYUfyq9ZX2m+fR+E2JFusZQc8=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "mrpt_sensors";
  version = "0.2.3-1";
  src = sources.mrpt_sensors-eb972a441598acf641fa65ee8b919e6fb82e409b;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ mrpt_generic_sensor mrpt_sensor_bumblebee_stereo mrpt_sensor_gnss_nmea mrpt_sensor_gnss_novatel mrpt_sensor_imu_taobotics mrpt_sensorlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS nodes for various robotics sensors via mrpt-hwdrivers. Metapackage for all mrpt_sensor packages.";
  };
}
