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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9eb95b56da84a433d4fa193bd08a2393ce42f5a6";
        hash = "sha256-90md4EFW0GBHz676RCkPdWqqcFzJ9HYZcsSrEbCpWts=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
