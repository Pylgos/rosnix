{
  ament-cmake,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  geographic-msgs,
  geometry-msgs,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tuw_object_map_msgs";
  version = "0.2.5-1";
  src = finalAttrs.passthru.sources."tuw_object_map_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_object_map_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_object_map_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "4a355168eed2bcee0a4da880897f916705853ed4";
        hash = "sha256-EsBMWUvkkLCr2u96/+Vd8cMfXvB4rz7nBdnV2rB0OSQ=";
      };
    };
  });
  meta = {
    description = "The tuw_object_map_msgs package";
  };
})
