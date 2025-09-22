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
  version = "1.2.0-1";
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
        rev = "5794b470ace0b662836f223b8fe4a6b4b4e40a69";
        hash = "sha256-lHtcjBG4WbizMazUSjAzuyavlCK8wVVhs+9uiKiOoEc=";
      };
    };
  });
  meta = {
    description = "A package containing simulation interfaces including messages, services and actions";
  };
})
