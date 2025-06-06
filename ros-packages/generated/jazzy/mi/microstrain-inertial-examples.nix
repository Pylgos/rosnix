{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  microstrain-inertial-driver,
  mkSourceSet,
  rosSystemPackages,
  rviz-imu-plugin,
  rviz2,
  sensor-msgs,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "microstrain_inertial_examples";
  version = "4.6.1-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_examples" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_examples-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "0a14a8d816817dc97d935cf3ce831b0aee1174cd";
        hash = "sha256-alCkd8SfcUq3YiB6ccX/j8ch7IFo5maWqEnVYFP209M=";
      };
    };
  });
  meta = {
    description = "Simple examples using the microstrain_inertial_driver for MicroStrain sensors.";
  };
})
