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
  version = "0.37.0-1";
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
        rev = "9015da4035272574d7034d5ac93a5c91a3657894";
        hash = "sha256-B0CvDR9AkrwrNCTzci3+3z8qh5bTBK+kMRqQOOUtg2c=";
      };
    };
  });
  meta = {
    description = "Custom messages for real-time pendulum control.";
  };
})
