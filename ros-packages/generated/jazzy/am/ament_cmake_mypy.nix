{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_mypy,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_mypy-705ae426f665fa378fe2b962bf460bb85426f6d8 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_mypy-705ae426f665fa378fe2b962bf460bb85426f6d8-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "705ae426f665fa378fe2b962bf460bb85426f6d8";
        hash = "sha256-bEBmui69Fivty7/hw53LagD0lrC9qHgSMMkYZQUzKRE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_mypy";
  version = "0.17.1-1";
  src = sources.ament_cmake_mypy-705ae426f665fa378fe2b962bf460bb85426f6d8;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_test ament_mypy ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_mypy to perform static type analysis on python code with mypy.";
  };
}
