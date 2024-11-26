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
  version = "0.35.1-1";
  src = finalAttrs.passthru.sources."pendulum_msgs";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "pendulum_msgs" = substituteSource {
        src = fetchgit {
          name = "pendulum_msgs-source";
          url = "https://github.com/ros2-gbp/demos-release.git";
          rev = "f8fbdd446d674db12416361974669297e12b9d15";
          hash = "sha256-/ICUL21LppoTGqecxi+O5VVJ5y5klaNstU5sk+gr/7g=";
        };
      };
    });
  };
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
