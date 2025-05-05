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
  pname = "rmf_door_msgs";
  version = "3.3.1-1";
  src = finalAttrs.passthru.sources."rmf_door_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_door_msgs" = substituteSource {
      src = fetchgit {
        name = "rmf_door_msgs-source";
        url = "https://github.com/ros2-gbp/rmf_internal_msgs-release.git";
        rev = "986379366c8d3cea206c7e70ca31dc0f085a2757";
        hash = "sha256-QO2MDDtXTa8mwRTW5kPJkmHhAoJiLSl8vHWOIaKDhqM=";
      };
    };
  });
  meta = {
    description = "Messages used to interface to doors";
  };
})
