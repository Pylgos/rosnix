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
  version = "7.3.2-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation_cmake" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "6d00fe354fabf517c8303d501e4d2a92fc84c6c0";
        hash = "sha256-3zQG30pXkx6uTbThttzV06j7IctXnAaT5XJ4DFIPyNc=";
      };
    };
  });
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
})
