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
  version = "3.5.0-1";
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
        rev = "9c23cb556b366cd341e6e6d0229a7b3b8fa9d46b";
        hash = "sha256-kcos6k2DaKjuq16Z5gyEF4SMhU03US9mThCnLdJOpfo=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to dispenser workcells";
  };
})
