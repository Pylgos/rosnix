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
  gripper-controllers,
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
  version = "4.19.0-1";
  src = finalAttrs.passthru.sources."ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gripper-controllers imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "ce0f04bed807cdcce217a6fd8f5e698fe333743a";
        hash = "sha256-2R+z06ZILhSzZ5uGKBtfNTrPSBzC9UbUAY0nCqHnqRA=";
      };
    };
  });
  meta = {
    description = "Metapackage for ros2_controllers related packages";
  };
})
