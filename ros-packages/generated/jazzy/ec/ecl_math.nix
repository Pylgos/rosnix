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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_math-8c03abd2b51a5c4517c465743b82c07def3571a2 = substituteSource {
      src = fetchgit {
        name = "ecl_math-8c03abd2b51a5c4517c465743b82c07def3571a2-source";
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
  src = sources.ecl_math-8c03abd2b51a5c4517c465743b82c07def3571a2;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_license ecl_type_traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "This package provides simple support to cmath, filling in holes or redefining in a c++ formulation where desirable.";
  };
}
