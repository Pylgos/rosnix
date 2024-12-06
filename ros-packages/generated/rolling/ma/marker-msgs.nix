{
  ament-cmake,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "marker_msgs";
  version = "0.0.8-1";
  src = finalAttrs.passthru.sources."marker_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "marker_msgs" = substituteSource {
      src = fetchgit {
        name = "marker_msgs-source";
        url = "https://github.com/ros2-gbp/marker_msgs-release.git";
        rev = "8aa78dca85331364821f5ec14785e59de90e99c5";
        hash = "sha256-TJ+mJSLub3gPCgw1hkWHwCQISpkllJxEB3y/zH9Syqs=";
      };
    };
  });
  meta = {
    description = "The marker_msgs package contains messages usable to setup a marker/fiducial system. The package distinguishes between two types of messages. First messages to describe the properties of a marker/fiducial detection system and the detected markers. Secondly messages used to represent a map of markers/features with covariances as it would be produced by a SLAM system or published by a map server for self-localization.";
  };
})
