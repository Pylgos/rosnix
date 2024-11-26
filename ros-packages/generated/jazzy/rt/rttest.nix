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
  version = "0.17.0-3";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rttest" = substituteSource {
        src = fetchgit {
          name = "rttest-source";
          url = "https://github.com/ros2-gbp/realtime_support-release.git";
          rev = "19a193b3d09bcc656177b5df025466181096871d";
          hash = "sha256-DzzoynuB0QJTrIEO6Y6FHd2Im5vR4jSXYc/6IFcZ65o=";
        };
      };
    });
  };
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
