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
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_clang_tidy = substituteSource {
      src = fetchgit {
        name = "ament_cmake_clang_tidy-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "562390b923d85145a6adf9531e3a9f3a9e2422a4";
        hash = "sha256-4ZgjaZqJQsEHsalfHbssmhm/5Hx+sM1L+BWEMkKOds4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_clang_tidy";
  version = "0.17.1-1";
  src = sources.ament_cmake_clang_tidy;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_clang_tidy ament_cmake_test ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_clang_tidy to lint C / C++ code using clang tidy.";
  };
}
