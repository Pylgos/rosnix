{
  ament_clang_format,
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_clang_format = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_format-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "16a66cfd81f676c8258b6b812bb56f14117b8d9f";
        hash = "sha256-rmgQ2r2Oag6VsYOdzTBf2PJiWoD+cv8UxmmqNquzFaw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_format";
  version = "0.18.1-1";
  src = sources.ament_cmake_clang_format;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_format ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_clang_format to lint C / C++ code using clang format.";
  };
}
