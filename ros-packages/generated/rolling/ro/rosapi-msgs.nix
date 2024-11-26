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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."rosapi_msgs";
  nativeBuildInputs = [ ament-cmake-ros rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces rcl-interfaces rosidl-default-runtime ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rosapi_msgs" = substituteSource {
        src = fetchgit {
          name = "rosapi_msgs-source";
          url = "https://github.com/ros2-gbp/rosbridge_suite-release.git";
          rev = "c3c934f159ea31a4111736a14887dc024a8c209b";
          hash = "sha256-3d3HJrzVrI52IhHt3S5hRgjvZj5oPWLS834RxpVQOxw=";
        };
      };
    });
  };
  meta = {
    description = "Provides service calls for getting ros meta-information, like list of topics, services, params, etc.";
  };
})
