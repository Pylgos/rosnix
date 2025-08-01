{
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
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."simulation_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "simulation_interfaces" = substituteSource {
      src = fetchgit {
        name = "simulation_interfaces-source";
        url = "https://github.com/ros2-gbp/simulation_interfaces-release.git";
        rev = "9feb19683c2a34ed18d05f42ebd22bb9575f0b90";
        hash = "sha256-AR5fXetnUbJNFmcJMzWtABwDfWO5FpLhqYpfWfxqu5w=";
      };
    };
  });
  meta = {
    description = "A package containing simulation interfaces including messages, services and actions";
  };
})
