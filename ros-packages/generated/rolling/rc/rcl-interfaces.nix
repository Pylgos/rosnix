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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rcl_interfaces";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rosidl-default-runtime ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rcl_interfaces" = substituteSource {
      src = fetchgit {
        name = "rcl_interfaces-source";
        url = "https://github.com/ros2-gbp/rcl_interfaces-release.git";
        rev = "11a1ef4461e14dff698008d8e521b6420b4a62f9";
        hash = "sha256-ffaqjun7i27yFIAwnelLajGi02A3cy0C/cJ89XVntW0=";
      };
    };
  });
  meta = {
    description = "The ROS client library common interfaces. This package contains the messages and services which ROS client libraries will use under the hood to communicate higher level concepts such as parameters.";
  };
})
