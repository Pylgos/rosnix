{
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
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "scenario_execution_interfaces" = substituteSource {
      src = fetchgit {
        name = "scenario_execution_interfaces-source";
        url = "https://github.com/ros2-gbp/scenario_execution-release.git";
        rev = "1d0d22f55920d965b442eca873026d1e33d979ce";
        hash = "sha256-nKQT3rPBMOSVVolAZEBNP1ZPUFSkckOXIvxMb9Ak74I=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "scenario_execution_interfaces";
  version = "1.2.0-4";
  src = finalAttrs.passthru.sources."scenario_execution_interfaces";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "ROS2 Interfaces for Scenario Execution";
  };
})
