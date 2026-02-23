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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."rcl_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_interfaces" = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "1169e367ee1c759417bd76496da583f9b7cb42b6";
        hash = "sha256-dmMEe++3YE/f2o6g/N8wlN1sZniq3MIENAzFtQnN1Ao=";
      };
    };
  });
  meta = {
    description = "The ROS client library common interfaces.\n    This package contains the messages and services which ROS client libraries will use under the hood to\n    communicate higher level concepts such as parameters.\n  ";
  };
})
