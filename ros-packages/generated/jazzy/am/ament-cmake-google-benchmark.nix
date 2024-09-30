{
  ament-cmake-core,
  ament-cmake-export-dependencies,
  ament-cmake-python,
  ament-cmake-test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  google-benchmark-vendor,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ament_cmake_google_benchmark" = substituteSource {
      src = fetchgit {
        name = "ament_cmake_google_benchmark-source";
        url = "https://github.com/ros2-gbp/ament_cmake-release.git";
        rev = "304fb5c4cd27736a60362d7971c8c00cb9ce92a3";
        hash = "sha256-3R3pYhCRVi6AFjNR7zQupuFKUNA0p1kv6xnew6hXOtc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "2.5.2-1";
  src = sources."ament_cmake_google_benchmark";
  nativeBuildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-test google-benchmark-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament-cmake-core ament-cmake-export-dependencies ament-cmake-python ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-cmake-test google-benchmark-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The ability to add Google Benchmark tests in the ament buildsystem in CMake.";
  };
}
