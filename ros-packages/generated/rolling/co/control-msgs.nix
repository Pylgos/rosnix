{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  diagnostic-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  sensor-msgs,
  std-msgs,
  substituteSource,
  trajectory-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "control_msgs";
  version = "6.5.0-1";
  src = finalAttrs.passthru.sources."control_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces diagnostic-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces diagnostic-msgs geometry-msgs rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "control_msgs" = substituteSource {
      src = fetchgit {
        name = "control_msgs-source";
        url = "https://github.com/ros2-gbp/control_msgs-release.git";
        rev = "4be6d25efaef188dc94fe846be1809e958e5d5bf";
        hash = "sha256-yxhI56L2RO2ihH5gOhXW36zTqsnO1Pa7dPP2MbFGVNU=";
      };
    };
  });
  meta = {
    description = "\n    control_msgs contains base messages and actions useful for\n    controlling robots. It provides representations for controller\n    setpoints and joint and cartesian trajectories.\n  ";
  };
})
