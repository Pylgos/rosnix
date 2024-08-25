{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pep257 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pep257-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "a8ecb6e0dad421016fe3b344893d99df5b5a266a";
        hash = "sha256-KK/puCJaueNmVkNyucowZFhyXcoPwB0/qUkqDOjMygg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pep257";
  version = "0.17.1-1";
  src = sources.ament_cmake_pep257;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pep257 ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_pep257 ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_pep257 to check code against the docstring style conventions in PEP 257.";
  };
}
