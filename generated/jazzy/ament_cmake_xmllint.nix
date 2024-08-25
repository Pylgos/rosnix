{
  ament_cmake_copyright,
  ament_cmake_core,
  ament_cmake_lint_cmake,
  ament_cmake_test,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_cmake_xmllint = substituteSource {
      src = fetchgit {
        name = "ament_cmake_xmllint-source";
        url = "https://github.com/ros2-gbp/ament_lint-release.git";
        rev = "8013b5d9a21161b181346c568df60d37d7aac2fd";
        hash = "sha256-3B93teFzxO0437/wDohxprbq6i18PRBswRfYFL4fBQc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_cmake_xmllint";
  version = "0.17.1-1";
  src = sources.ament_cmake_xmllint;
  nativeBuildInputs = [ ament_cmake_core ];
  propagatedNativeBuildInputs = [ ament_cmake_test ament_xmllint ];
  buildInputs = [ ament_cmake_core ];
  propagatedBuildInputs = [ ament_cmake_test ament_xmllint ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_copyright ament_cmake_lint_cmake ];
  missingDependencies = [  ];
  meta = {
    description = "The CMake API for ament_xmllint to check XML file using xmmlint.";
  };
}
