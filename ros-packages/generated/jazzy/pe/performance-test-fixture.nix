{
  ament-cmake-core,
  ament-cmake-export-dependencies,
  ament-cmake-export-targets,
  ament-cmake-google-benchmark,
  ament-cmake-test,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google-benchmark-vendor,
  mkSourceSet,
  osrf-testing-tools-cpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "performance_test_fixture" = substituteSource {
      src = fetchgit {
        name = "performance_test_fixture-source";
        url = "https://github.com/ros2-gbp/performance_test_fixture-release.git";
        rev = "0def28c9105ab3ae8ad84850775daf48bee2d44a";
        hash = "sha256-iCMlZK5/HBOfZGrAQNwLwJJxq5IA8VvRyn21btecE9A=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "performance_test_fixture";
  version = "0.2.1-2";
  src = sources."performance_test_fixture";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-export-targets ament-cmake-test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-google-benchmark google-benchmark-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ osrf-testing-tools-cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-cmake-google-benchmark ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Test fixture and CMake macro for using osrf_testing_tools_cpp with Google Benchmark";
  };
}
