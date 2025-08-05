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
  version = "0.37.2-1";
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
        rev = "84c1d0a022d90bc519371c56a58a50f9d2e660a1";
        hash = "sha256-Cj8fj34CkGmY9ZJ5490mGflhyBdcKDyjBgK3I//66OM=";
      };
    };
  });
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
