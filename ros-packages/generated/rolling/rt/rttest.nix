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
  version = "0.20.0-1";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rttest" = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "28fcb0f85f683a5a079c647d18fb10d061d9107a";
        hash = "sha256-O4VguqeFOHJrnZVrE2GjFxHJFmYwKOQ5YAODUTYtUOk=";
      };
    };
  });
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
