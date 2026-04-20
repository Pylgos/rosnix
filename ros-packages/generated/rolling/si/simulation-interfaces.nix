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
  version = "2.1.0-1";
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
        rev = "97f0ee91a516f132517fee9b8328289670eb772c";
        hash = "sha256-OHVOAsY8zrliXEAfC8MXVZBpvQr9OjSzAHACOBSyMK0=";
      };
    };
  });
  meta = {
    description = "A package containing simulation interfaces including messages, services and actions";
  };
})
