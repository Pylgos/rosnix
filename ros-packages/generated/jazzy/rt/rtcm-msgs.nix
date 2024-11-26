{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rtcm_msgs";
  version = "1.1.6-4";
  src = finalAttrs.passthru.sources."rtcm_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rtcm_msgs" = substituteSource {
      src = fetchgit {
        name = "rtcm_msgs-source";
        url = "https://github.com/ros2-gbp/rtcm_msgs-release.git";
        rev = "3e17a8d363a51a20a0d8d6eb0af1879e2adf2fee";
        hash = "sha256-5yTtIdGostlOwChSlKKL4JivCyK284g0KYZxB6GBtBY=";
      };
    };
  });
  meta = {
    description = "The rtcm_msgs package contains messages related to data in the RTCM format.";
  };
})
