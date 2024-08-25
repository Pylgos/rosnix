{
  ament_black,
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_black = substituteSource {
      src = fetchgit {
        name = "ament_cmake_black-source";
        url = "https://github.com/ros2-gbp/ament_black-release.git";
        rev = "3bed32b7fe1bf14e00c1b2dc2fd5841115368dbc";
        hash = "sha256-Vmc2NbPhebM8KaycynJYsn7VCQvHDXlprZIZQV3rzGQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_black";
  version = "0.2.5-1";
  src = sources.ament_cmake_black;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_black ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ament_cmake_xmllint ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_black to lint Python code using black.";
  };
}
