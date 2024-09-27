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
    ament_cmake_google_benchmark-304fb5c4cd27736a60362d7971c8c00cb9ce92a3 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-304fb5c4cd27736a60362d7971c8c00cb9ce92a3-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "304fb5c4cd27736a60362d7971c8c00cb9ce92a3";
        hash = "sha256-3R3pYhCRVi6AFjNR7zQupuFKUNA0p1kv6xnew6hXOtc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "2.5.2-1";
  src = sources.ament_cmake_google_benchmark-304fb5c4cd27736a60362d7971c8c00cb9ce92a3;
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
