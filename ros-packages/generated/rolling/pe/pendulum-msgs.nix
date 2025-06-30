{
  ament-cmake,
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
  pname = "pendulum_msgs";
  version = "0.37.1-1";
  src = finalAttrs.passthru.sources."pendulum_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-generators rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "pendulum_msgs" = substituteSource {
      src = fetchgit {
        name = "pendulum_msgs-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "974c328b6a2123208f2251b369758faee9c58b89";
        hash = "sha256-ja06DV2sAvRWAh3lSItTzkSm/pkk/CSNNSZ99E7Ugxo=";
      };
    };
  });
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
