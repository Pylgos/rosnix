{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_license,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_math = substituteSource {
      src = fetchgit {
        name = "ecl_math-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "8c03abd2b51a5c4517c465743b82c07def3571a2";
        hash = "sha256-FJevrMf2MxF+heenjke0paV5yAvePcxmHcEW7Is+Pmc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_math";
  version = "1.2.1-5";
  src = sources.ecl_math;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_license ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides simple support to cmath, filling in holes or redefining in a c++ formulation where desirable.";
  };
}
