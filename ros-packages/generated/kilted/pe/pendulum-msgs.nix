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
  version = "0.36.3-1";
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
        rev = "8563f935437002ce7326dac5e6685bd8f766d622";
        hash = "sha256-EIjc5FfKKpPpCfSNjF/K1LyP2flLFX0qrssK05ig1SU=";
      };
    };
  });
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
