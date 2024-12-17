{
  ament-cmake,
  ament-cmake-cppcheck,
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
  pname = "tuw_geo_msgs";
  version = "0.2.4-1";
  src = finalAttrs.passthru.sources."tuw_geo_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ builtin-interfaces geographic-msgs geometry-msgs rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-cmake-cppcheck ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "tuw_geo_msgs" = substituteSource {
      src = fetchgit {
        name = "tuw_geo_msgs-source";
        url = "https://github.com/ros2-gbp/tuw_msgs-release.git";
        rev = "bb293f33cb87ea75cb9e685d7ce2e7d0e6a6848e";
        hash = "sha256-ZQgyr8p4eZyPQndvh+lJUhCLXpVoxD5HLFTm+5MS0ho=";
      };
    };
  });
  meta = {
    description = "The tuw_geo_msgs package";
  };
})
