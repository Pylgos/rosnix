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
  version = "0.33.5-1";
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
          rev = "83f032490db157d7ed8370f619b4c1c66a1f357b";
          hash = "sha256-1JWm79OTUZtFSw5uQlLrFJa7pFC4lPijuZdDjWMq3X4=";
        };
      };
    });
  };
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
