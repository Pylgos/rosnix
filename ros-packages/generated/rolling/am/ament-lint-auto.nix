{
  ament-cmake-core,
  ament-cmake-test,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "ament_lint_auto";
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "eba6fd6cca45f44b7855647f02ea8a6473af8c41";
        hash = "sha256-MRZFzVkeZCGZWuwV0gDHTF2J7jyzuRHn3V0rT0x0EgY=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
