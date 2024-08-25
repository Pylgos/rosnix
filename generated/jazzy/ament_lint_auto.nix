{
  ament_cmake_core,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_lint_auto = substituteSource {
      src = fetchgit {
        name = "ament_lint_auto-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "9dfbe5dc5dc7367e57c8df22283e0a2d9c674511";
        hash = "sha256-cTEKLki3mpr0mnz11IYBahCl0Pn7oWCg5BfIwzUCvU4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_lint_auto";
  version = "0.17.1-1";
  src = sources.ament_lint_auto;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ ament_cmake_core ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_core ament_cmake_test ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "The auto-magic functions for ease to use of the ament linters in CMake.";
  };
}
