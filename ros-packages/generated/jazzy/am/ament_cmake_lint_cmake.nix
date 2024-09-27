{
  ament_cmake_core,
  ament_cmake_test,
  ament_lint_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_lint_cmake-f0e89fa066b9cdf407170c6debc0f8f655dab2c6 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_lint_cmake-f0e89fa066b9cdf407170c6debc0f8f655dab2c6-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "f0e89fa066b9cdf407170c6debc0f8f655dab2c6";
        hash = "sha256-sYyP+R1o6szZhGnxGRhLcJa9nD6UKY98iFHIp+1ElH4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_lint_cmake";
  version = "0.17.1-1";
  src = sources.ament_cmake_lint_cmake-f0e89fa066b9cdf407170c6debc0f8f655dab2c6;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ament_lint_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_test ament_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_lint_cmake to lint CMake code using cmakelint.";
  };
}
