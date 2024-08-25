{
  ament_cmake_core,
  ament_cmake_export_dependencies,
  ament_cmake_python,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google_benchmark_vendor,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_google_benchmark = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "d84d060f506dd904139e9450eacad833d4259a22";
        hash = "sha256-FxtmiXzHSrK7/E2i6xZY/5TEvSrr23CPQerWTCBLmAw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "2.7.0-1";
  src = sources.ament_cmake_google_benchmark;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedNativeBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  buildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ];
  propagatedBuildInputs = [ ament_cmake_test google_benchmark_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
}
