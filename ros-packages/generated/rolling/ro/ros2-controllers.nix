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
  gpio-controllers,
  gps-sensor-broadcaster,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mecanum-drive-controller,
  mkSourceSet,
  parallel-gripper-controller,
  pid-controller,
  pose-broadcaster,
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
  version = "5.1.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gps-sensor-broadcaster imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gps-sensor-broadcaster imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "f3184b8520717297e06812995aebcc1dc018c072";
        hash = "sha256-V0039xr8HvLfWBQa1DW62VIyXbg2nH4mootoQC/qIB4=";
      };
    };
  });
  meta = {
    description = "Metapackage for ros2_controllers related packages";
  };
})
