{
  action-msgs,
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
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
let
  sources = mkSourceSet (sources: {
    "control_msgs" = substituteSource {
      src = fetchgit {
        name = "control_msgs-source";
        url = "https://github.com/ros2-gbp/control_msgs-release.git";
        rev = "a1ef9a000135c4eacc1fa0b36b9990ac0f812137";
        hash = "sha256-URQCB0GxwGeBx7qDLvfeBxUHDgifVGWnImV68kDRCws=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "control_msgs";
  version = "5.2.0-1";
  src = finalAttrs.passthru.sources."control_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime sensor-msgs std-msgs trajectory-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "control_msgs contains base messages and actions useful for controlling robots. It provides representations for controller setpoints and joint and cartesian trajectories.";
  };
})
