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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_dispenser_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_dispenser_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_dispenser_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_dispenser_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "61720e68e4a4c4f29a09cf7507f4816a512caf0a";
        hash = "sha256-qpAm0ecWPoXYYo1hULsTjDPidPxEL7uKxI6unEvelow=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to dispenser workcells";
  };
})
