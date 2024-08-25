{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pyflakes,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pyflakes = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pyflakes-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "d6c4463ac1ae85b3a4ec01f4fc1dcc28ae68cbbe";
        hash = "sha256-/QXs6c3/sXVRznCZn4kS971pF5f53YHe1YXy8NqjY3Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pyflakes";
  version = "0.17.1-1";
  src = sources.ament_cmake_pyflakes;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pyflakes ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_pyflakes to check code using pyflakes.";
  };
}
