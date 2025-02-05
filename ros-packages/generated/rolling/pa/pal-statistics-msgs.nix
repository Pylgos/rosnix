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
  version = "2.6.1-1";
  src = finalAttrs.passthru.sources."pal_statistics_msgs";
  nativeBuildInputs = [ ament-cmake rosidl-default-generators ];
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "pal_statistics_msgs" = substituteSource {
      src = fetchgit {
        name = "pal_statistics_msgs-source";
        url = "https://github.com/ros2-gbp/pal_statistics-release.git";
        rev = "bf44174f92a9d9aa0c5e0f42d9a00b9506481ad6";
        hash = "sha256-gqCuqkHX3XSwLAMHmYVveMDv3sovitwZB1+Pfvcy5To=";
      };
    };
  });
  meta = {
    description = "Statistics msgs package";
  };
})
