{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrpt-generic-sensor,
  mrpt-sensor-bumblebee-stereo,
  mrpt-sensor-gnss-nmea,
  mrpt-sensor-gnss-novatel,
  mrpt-sensor-imu-taobotics,
  mrpt-sensorlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mrpt_sensors";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."mrpt_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common ];
  propagatedBuildInputs = [ mrpt-generic-sensor mrpt-sensor-bumblebee-stereo mrpt-sensor-gnss-nmea mrpt-sensor-gnss-novatel mrpt-sensor-imu-taobotics mrpt-sensorlib ];
  passthru = {
    sources = mkSourceSet (sources: {
      "mrpt_sensors" = substituteSource {
        src = fetchgit {
          name = "mrpt_sensors-source";
          url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
          rev = "eb972a441598acf641fa65ee8b919e6fb82e409b";
          hash = "sha256-B8MCdYv31gBZx0BxHHZYUfyq9ZX2m+fR+E2JFusZQc8=";
        };
      };
    });
  };
  meta = {
    description = "ROS nodes for various robotics sensors via mrpt-hwdrivers. Metapackage for all mrpt_sensor packages.";
  };
})
