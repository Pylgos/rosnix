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
  version = "4.18.0-2";
  src = finalAttrs.passthru.sources."ros2_controllers";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ackermann-steering-controller admittance-controller bicycle-steering-controller diff-drive-controller effort-controllers force-torque-sensor-broadcaster forward-command-controller gpio-controllers gripper-controllers imu-sensor-broadcaster joint-state-broadcaster joint-trajectory-controller mecanum-drive-controller parallel-gripper-controller pid-controller pose-broadcaster position-controllers range-sensor-broadcaster steering-controllers-library tricycle-controller tricycle-steering-controller velocity-controllers ];
  passthru.sources = mkSourceSet (sources: {
    "ros2_controllers" = substituteSource {
      src = fetchgit {
        name = "ros2_controllers-source";
        url = "https://github.com/ros2-gbp/ros2_controllers-release.git";
        rev = "d03c873a6e4f7dbc1fc4042d6cfb195972ff2909";
        hash = "sha256-1v1Ib8/G+Eyc8t0S7KmA2eIySSDEux+TcXEqASbe7p0=";
      };
    };
  });
  meta = {
    description = "Metapackage for ros2_controllers related packages";
  };
})
