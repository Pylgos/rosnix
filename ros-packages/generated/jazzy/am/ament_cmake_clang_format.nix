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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_clang_format-860fa42aed1207f1c5555f90b3f8f8972fda89de = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_format-860fa42aed1207f1c5555f90b3f8f8972fda89de-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "860fa42aed1207f1c5555f90b3f8f8972fda89de";
        hash = "sha256-XgbrX57vRIqCL+mko/GGENqmmDq9upqlbL4SRF9DHmQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_format";
  version = "0.17.1-1";
  src = sources.ament_cmake_clang_format-860fa42aed1207f1c5555f90b3f8f8972fda89de;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_clang_format ament_cmake_test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_clang_format to lint C / C++ code using clang format.";
  };
}
