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
        rev = "d84d060f506dd904139e9450eacad833d4259a22";
        hash = "sha256-FxtmiXzHSrK7/E2i6xZY/5TEvSrr23CPQerWTCBLmAw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ament_cmake_google_benchmark";
  version = "2.7.0-1";
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
