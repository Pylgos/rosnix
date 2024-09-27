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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_google_benchmark-d84d060f506dd904139e9450eacad833d4259a22 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-d84d060f506dd904139e9450eacad833d4259a22-source";
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
  src = sources.ament_cmake_google_benchmark-d84d060f506dd904139e9450eacad833d4259a22;
  nativeBuildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test google_benchmark_vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake_core ament_cmake_export_dependencies ament_cmake_python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_test google_benchmark_vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
}
