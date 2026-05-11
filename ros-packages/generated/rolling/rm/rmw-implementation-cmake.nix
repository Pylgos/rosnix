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
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmw_implementation_cmake";
  version = "7.11.0-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation_cmake" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "99b145b6804eb63359b6f4cb69e1899d400253bf";
        hash = "sha256-trp1EBH8/P81HHCwg3YMHYn/htJO/3fzsfnw3539wws=";
      };
    };
  });
  meta = {
    description = "\n    CMake functions which can discover and enumerate available implementations.\n  ";
  };
})
