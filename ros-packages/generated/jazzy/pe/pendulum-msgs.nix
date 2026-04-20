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
  version = "0.33.10-1";
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
        rev = "b77430c5921f99ee3b9acda06db41b09b3144df0";
        hash = "sha256-gneUZ7fzqOyYi2iqH6zYBRqnKwABbF1/nlJmhpuBJwE=";
      };
    };
  });
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
