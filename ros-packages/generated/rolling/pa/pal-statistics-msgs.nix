{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "pal_statistics_msgs";
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."pal_statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_statistics_msgs" = substituteSource {
      src = fetchgit {
        name = "pal_statistics_msgs-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "26ffcb82d14ba45a2afe28fb2aea173b00287298";
        hash = "sha256-l/i+Y2x2ILtdvLhgAusav9oam/nCrQFRq5ZYprP4lIo=";
      };
    };
  });
  meta = {
    description = "Statistics msgs package";
  };
})
