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
  version = "0.21.0-1";
  src = finalAttrs.passthru.sources."ament_lint_auto";
  propagatedNativeBuildInputs = [ ament-cmake-core ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-core ament-cmake-test ];
  passthru.sources = mkSourceSet (sources: {
    "ament_lint_auto" = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "e6f781da96a4f793a50ce7dd369f3eb7d486eeac";
        hash = "sha256-nWV1Rt/MpgZQQrB6V5E1CU9LhxxsSN9ud5Qwj/EHjr0=";
      };
    };
  });
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
})
