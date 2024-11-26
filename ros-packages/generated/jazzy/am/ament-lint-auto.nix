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
  version = "0.17.1-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru = {
    sources = mkSourceSet (sources: {
      "ament_lint_auto" = substituteSource {
        src = fetchgit {
          name = "ament_lint_auto-source";
          url = "https://github.com/ros2-gbp/ament_lint-release.git";
          rev = "9dfbe5dc5dc7367e57c8df22283e0a2d9c674511";
          hash = "sha256-cTEKLki3mpr0mnz11IYBahCl0Pn7oWCg5BfIwzUCvU4=";
        };
      };
    });
  };
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
