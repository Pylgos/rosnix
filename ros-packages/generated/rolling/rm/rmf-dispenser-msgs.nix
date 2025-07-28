{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_dispenser_msgs";
  version = "4.0.0-1";
  src = finalAttrs.passthru.sources."rmf_dispenser_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_dispenser_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_dispenser_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "1dc57a1142b77446d016b2144a466746ece8ae5f";
        hash = "sha256-Onf/X+m9jUi5SIkAHzA5I8XwtB0sRHBYSxv4sSLl1uk=";
      };
    };
  });
  meta = {
    description = "A package containing messages used to interface to dispenser workcells";
  };
})
