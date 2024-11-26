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
  version = "4.5.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "microstrain_inertial_examples" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_examples-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "81d5861e2c6e097de8d2f7cc4deaacbdef1fdc3a";
        hash = "sha256-Hx7NDq/2SgHHYR/geQ1eke+0WnBAdW4Jk+VC6iJPTGM=";
      };
    };
  });
  meta = {
    description = "Simple examples using the microstrain_inertial_driver for MicroStrain sensors.";
  };
})
