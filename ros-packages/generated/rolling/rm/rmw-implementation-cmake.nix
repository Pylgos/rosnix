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
  version = "7.5.1-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rmw_implementation_cmake" = substituteSource {
      src = fetchgit {
        name = "rmw_implementation_cmake-source";
        url = "https://github.com/ros2-gbp/rmw-release.git";
        rev = "5859ed4b3c914ad265c28875b084bc654b77098a";
        hash = "sha256-c+/NFwdSErFacuZP0+ee67tX7v6xb/QuyXjpbx5nYHY=";
      };
    };
  });
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
})
