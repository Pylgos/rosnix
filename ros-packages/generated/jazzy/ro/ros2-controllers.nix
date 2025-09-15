{
  ackermann-steering-controller,
  admittance-controller,
  ament-cmake,
  bicycle-steering-controller,
  buildAmentCmakePackage,
  chained-filter-controller,
  diff-drive-controller,
  effort-controllers,
  fetchgit,
  fetchurl,
  fetchzip,
  force-torque-sensor-broadcaster,
  forward-command-controller,
  gpio-controllers,
  gps-sensor-broadcaster,
  gripper-controllers,
  imu-sensor-broadcaster,
  joint-state-broadcaster,
  joint-trajectory-controller,
  mecanum-drive-controller,
  mkSourceSet,
  omni-wheel-drive-controller,
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
  version = "4.32.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller chained-filter-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gps-sensor-broadcaster gripper-controllers imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller omni-wheel-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller chained-filter-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gps-sensor-broadcaster gripper-controllers imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller omni-wheel-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "c54a748fd13a255cfc603abb96eb7d1a808e43e5";
        hash = "sha256-zf9n6O0CKLncK6icM76jUoLYWWlymg1eLQn6C2oQ9PA=";
      };
    };
  });
  meta = {
    description = "Metapackage for ros2_controllers related packages";
  };
})
