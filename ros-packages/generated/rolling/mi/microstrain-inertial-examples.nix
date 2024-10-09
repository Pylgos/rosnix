{
  ament-cmake,
  buildRosPackage,
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
let
  sources = mkSourceSet (sources: {
    "microstrain_inertial_examples" = substituteSource {
      src = fetchgit {
        name = "microstrain_inertial_examples-source";
        url = "https://github.com/ros2-gbp/microstrain_inertial-release.git";
        rev = "20eec396cc8b70405d524d236a419958cf90a67f";
        hash = "sha256-vlJ4EDAwNONvu1/tlReQfTUUw2hQlaWRV+FVHA2Cp6g=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage (finalAttrs: {
  pname = "microstrain_inertial_examples";
  version = "4.4.0-1";
  src = finalAttrs.passthru.sources."microstrain_inertial_examples";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ microstrain-inertial-driver rviz2 rviz-imu-plugin sensor-msgs tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Simple examples using the microstrain_inertial_driver for MicroStrain sensors.";
  };
})
