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
  version = "0.5.0-1";
  src = finalAttrs.passthru.sources."performance_test_fixture";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-export-targets ament-cmake-test ];
  propagatedNativeBuildInputs = [ ament-cmake-google-benchmark google-benchmark-vendor osrf-testing-tools-cpp ];
  buildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-export-targets ament-cmake-test ];
  propagatedBuildInputs = [ ament-cmake-google-benchmark google-benchmark-vendor osrf-testing-tools-cpp ];
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "performance_test_fixture" = substituteSource {
      src = fetchgit {
        name = "performance_test_fixture-source";
        url = "https://github.com/ros2-gbp/performance_test_fixture-release.git";
        rev = "cb14d7698a5f36f818274dbd08f8cbe5ff655346";
        hash = "sha256-uf7vSznU+fy8p2walVQJhDoBT2CFJXD087uufppzlj8=";
      };
    };
  });
  meta = {
    description = "\n    Test fixture and CMake macro for using osrf_testing_tools_cpp with Google Benchmark\n  ";
  };
})
