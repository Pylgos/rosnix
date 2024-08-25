{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_flake8,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_flake8 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_flake8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "e7a0ecd8bf25d988dbbea9ef6e3596242557852d";
        hash = "sha256-GzbWu2ZZCMu0THva1BaruSf2TsLcpi9FVddqmdDFpec=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_flake8";
  version = "0.18.1-1";
  src = sources.ament_cmake_flake8;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_flake8 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_flake8 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_flake8 to check code syntax and style conventions with flake8.";
  };
}
