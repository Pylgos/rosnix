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
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."mrpt_sensors";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-lint-auto ament-lint-common mrpt-generic-sensor mrpt-sensor-bumblebee-stereo mrpt-sensor-gnss-nmea mrpt-sensor-gnss-novatel mrpt-sensor-imu-taobotics mrpt-sensorlib ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-lint-auto ament-lint-common mrpt-generic-sensor mrpt-sensor-bumblebee-stereo mrpt-sensor-gnss-nmea mrpt-sensor-gnss-novatel mrpt-sensor-imu-taobotics mrpt-sensorlib ];
  passthru.sources = mkSourceSet (sources: {
    "mrpt_sensors" = substituteSource {
      src = fetchgit {
        name = "mrpt_sensors-source";
        url = "https://github.com/ros2-gbp/mrpt_sensors-release.git";
        rev = "684cb29ffd6c7595c72fd2ba4e57d3f7b3e42607";
        hash = "sha256-1opCMf/fKhtbvT/HWgvKW06PkUvMH1GXwfg4EeOMemA=";
      };
    };
  });
  meta = {
    description = "ROS nodes for various robotics sensors via mrpt-hwdrivers. Metapackage for all mrpt_sensor packages.";
  };
})
