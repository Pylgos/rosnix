{
  ackermann-steering-controller,
  admittance-controller,
  ament-cmake,
  bicycle-steering-controller,
  buildAmentCmakePackage,
  diff-drive-controller,
  effort-controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  forward-command-controller,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mkSourceSet,
  pid-controller,
  position-controllers,
  range-sensor-broadcaster,
  rosSystemPackages,
  steering-controllers-library,
  substituteSource,
  tricycle-controller,
  tricycle-steering-controller,
  velocity-controllers,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ros2_controllers";
  version = "4.16.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller pid-controller position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "579ccb04886e598059decbb1a0c0be81e1974676";
        hash = "sha256-0+yt2o2akyHyNxuH/NkEPH3OaFcKUYvuKG50nf+CHgc=";
      };
    };
  });
  meta = {
    description = "Metapackage for ROS2 controllers related packages";
  };
})
