{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_export_targets,
  ament_cmake_google_benchmark,
  ament_cmake_test,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google_benchmark_vendor,
  osrf_testing_tools_cpp,
  substituteSource,
}:
let
  sources = rec {
    performance_test_fixture = substituteSource {
      src = fetchgit {
        name = "performance_test_fixture-source";
        url = "https://github.com/ros2-gbp/performance_test_fixture-release.git";
        rev = "14ec312609f7e0fbdcde3ddf707c4d8ba7a0da2d";
        hash = "sha256-7eMswbYVShjFOhmDfpu76OC9rz8kiNFGNMpRNPblftI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "performance_test_fixture";
  version = "0.3.1-1";
  src = sources.performance_test_fixture;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_export_targets ament_cmake_test ];
  propagatedNativeBuildInputs = [ ament_cmake_google_benchmark google_benchmark_vendor ];
  buildInputs = [  ];
  propagatedBuildInputs = [ osrf_testing_tools_cpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_google_benchmark ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Test fixture and CMake macro for using osrf_testing_tools_cpp with Google Benchmark";
  };
}
