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
  version = "0.19.1-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "1554225a13424210b2c170a775cea979edc83eee";
        hash = "sha256-qOFJz+9yTJYr29th/qXVEEpzm76vMcNSGfY6ST7e75k=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
