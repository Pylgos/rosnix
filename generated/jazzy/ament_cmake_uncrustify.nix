{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_uncrustify = substituteSource {
      src = fetchgit {
        name = "ament_cmake_uncrustify-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "6296ed02fa5fa9a16d242bb7bdc750ab964031e8";
        hash = "sha256-GG2ciHIKYUTdWdMbrZrc0wGNOCd5BuePogbKcQPF7Og=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_uncrustify";
  version = "0.17.1-1";
  src = sources.ament_cmake_uncrustify;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_uncrustify ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_uncrustify ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_uncrustify to check code against styleconventions using uncrustify.";
  };
}
