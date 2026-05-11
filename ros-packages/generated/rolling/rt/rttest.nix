{
  ament-cmake,
  ament-cmake-gtest,
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
  pname = "rttest";
  version = "1.0.0-1";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rttest" = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "fb99659c15ba39656c2e7c2c7135b0c01ae8f261";
        hash = "sha256-ApYuidR/R6kbKfLdwtUDhYIF3hED4WnDlEhy6Zhrib8=";
      };
    };
  });
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
