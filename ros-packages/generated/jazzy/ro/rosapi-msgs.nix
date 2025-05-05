{
  ament-cmake-ros,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rcl-interfaces,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosapi_msgs";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."rosapi_msgs";
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedNativeBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  buildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  passthru.sources = mkSourceSet (sources: {
    "rosapi_msgs" = substituteSource {
      src = fetchgit {
        name = "rosapi_msgs-source";
        url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
        rev = "3e29493329179e77e02c31165b9009c605f65b8d";
        hash = "sha256-q1yOHzDW35OMul21yuM5zcmIaSEOUHWfOXwEt4DQFS8=";
      };
    };
  });
  meta = {
    description = "\n    Provides service calls for getting ros meta-information, like list of\n    topics, services, params, etc.\n  ";
  };
})
