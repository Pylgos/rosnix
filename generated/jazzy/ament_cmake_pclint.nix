{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_pclint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_pclint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_pclint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "4598f7358b2566f461b4efa944ecdfb9c7c2c050";
        hash = "sha256-+z9pHdy7Qbg/M9gZwkH5b3ZxkoTFPhe10AO3sfjvn1I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_pclint";
  version = "0.17.1-1";
  src = sources.ament_cmake_pclint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_pclint ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_pclint to perform static code analysis on C/C++ code using PC-lint.";
  };
}
