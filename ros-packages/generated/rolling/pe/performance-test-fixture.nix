{
  ament-cmake-core,
  ament-cmake-export-dependencies,
  ament-cmake-export-targets,
  ament-cmake-google-benchmark,
  ament-cmake-test,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google-benchmark-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "performance_test_fixture";
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."performance_test_fixture";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-export-targets ament-cmake-test ];
  propagatedNativeBuildInputs = [ ament-cmake-google-benchmark ];
  propagatedBuildInputs = [ google-benchmark-vendor osrf-testing-tools-cpp ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "performance_test_fixture" = substituteSource {
      src = fetchgit {
        name = "performance_test_fixture-source";
        url = "https://github.com/ros2-gbp/performance_test_fixture-release.git";
        rev = "a3bd92c25d46315d84002eb595bc9f8c0a3dfa32";
        hash = "sha256-SAllXuOLSDFLCtu/HE7ceIL6wev0ROyKy+U95odufLY=";
      };
    };
  });
  meta = {
    description = "Test fixture and CMake macro for using osrf_testing_tools_cpp with Google Benchmark";
  };
})
