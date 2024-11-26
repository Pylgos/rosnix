{
  ament-cmake,
  ament-lint-auto,
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
  pname = "rcl_interfaces";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rcl_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_interfaces" = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "e0b26d848e6c01ef9da18034a07afe8053aedd4b";
        hash = "sha256-3gKhh4yvrtEOlm1SS67JYGCOs3dbTv2K/VtSHlCKVf4=";
      };
    };
  });
  meta = {
    description = "The ROS client library common interfaces. This package contains the messages and services which ROS client libraries will use under the hood to communicate higher level concepts such as parameters.";
  };
})
