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
  version = "0.18.2-1";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rttest" = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "bf6f2e4595b613275a6ad7f01f45f31127d47e9c";
        hash = "sha256-mQ7u/24fZwA+ru+S2UNfw8ZaBKaS2qAv/CSGhJGx0t8=";
      };
    };
  });
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
