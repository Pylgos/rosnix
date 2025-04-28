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
  version = "0.19.0-1";
  src = finalAttrs.passthru.sources."rttest";
  nativeBuildInputs = [ ament-cmake ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rttest" = substituteSource {
      src = fetchgit {
        name = "rttest-source";
        url = "https://github.com/ros2-gbp/realtime_support-release.git";
        rev = "486e95958857317714920afb43fcc77be548d8ef";
        hash = "sha256-7xBa3ujIIeaidJi149KeV9dEt4G3BYe1kZfvHPuTEFk=";
      };
    };
  });
  meta = {
    description = "Instrumentation library for real-time performance testing";
  };
})
