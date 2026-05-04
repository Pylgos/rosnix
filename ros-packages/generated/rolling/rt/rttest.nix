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
  version = "0.20.0-2";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rttest" = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "2feb896614e5194e8744d0576bf96b92116ce9e7";
        hash = "sha256-O4VguqeFOHJrnZVrE2GjFxHJFmYwKOQ5YAODUTYtUOk=";
      };
    };
  });
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
