{
  action-msgs,
  ament-cmake,
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
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "simulation_interfaces";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."simulation_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ action-msgs builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "simulation_interfaces" = substituteSource {
      src = fetchgit {
        name = "simulation_interfaces-source";
        url = "https://github.com/ros2-gbp/simulation_interfaces-release.git";
        rev = "e969d9105c372920f8d3ac63a98a9655140dc0cc";
        hash = "sha256-hkPX8X16ZGnsdTQD9oCct3EjdrDcV8MwmFiH2HHb8q0=";
      };
    };
  });
  meta = {
    description = "A package containing simulation interfaces including messages, services and actions";
  };
})
