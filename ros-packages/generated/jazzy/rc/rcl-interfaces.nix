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
  version = "2.0.2-2";
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
        rev = "9c7b19dc93631608bcd38604143175a5d63e5e51";
        hash = "sha256-7FNEn996pHXba3q0kcEYwzrOMJcdzGOrgC5MQNqKIPA=";
      };
    };
  });
  meta = {
    description = "The ROS client library common interfaces.\n    This package contains the messages and services which ROS client libraries will use under the hood to\n    communicate higher level concepts such as parameters.\n  ";
  };
})
