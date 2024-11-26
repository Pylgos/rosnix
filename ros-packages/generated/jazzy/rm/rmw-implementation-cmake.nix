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
  version = "7.3.1-1";
  src = finalAttrs.passthru.sources."rmw_implementation_cmake";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmw_implementation_cmake" = substituteSource {
        src = fetchgit {
          name = "rmw_implementation_cmake-source";
          url = "https://github.com/ros2-gbp/rmw-release.git";
          rev = "7e0cca826ec27a0fe05672ed366b35468b492adb";
          hash = "sha256-aXrzFTM5hESGOTN25ojbzGxw19rcwTsGhCqCqAiDLz0=";
        };
      };
    });
  };
  meta = {
    description = "CMake functions which can discover and enumerate available implementations.";
  };
})
