{
  ament_clang_tidy,
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
    ament_cmake_clang_tidy-49f79afb240141cd3c89cb542ffb2547c031a126 = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-49f79afb240141cd3c89cb542ffb2547c031a126-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "49f79afb240141cd3c89cb542ffb2547c031a126";
        hash = "sha256-1Jf+nzvRetlayhXvmKC9VA4XMyrzWH6C9M4kxBfJiBU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_tidy";
  version = "0.18.1-1";
  src = sources.ament_cmake_clang_tidy-49f79afb240141cd3c89cb542ffb2547c031a126;
  nativeBuildInputs = [ ament_cmake_core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_clang_tidy ament_cmake_test ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.";
  };
}
