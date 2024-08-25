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
        rev = "b8d1b6ee68852df1be5bdc5b5da035333bdde5d0";
        hash = "sha256-JYKDqcUKWLZvS/7uH/b8uweqB8C1w9INwldLHIqvxXU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pyflakes";
  version = "0.18.1-1";
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
