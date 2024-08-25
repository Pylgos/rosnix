{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ament_index_cpp = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-source";
        url = "https://github.com/ros2-gbp/ament_index-release.git";
        rev = "3c5dd9ddaad1ddb13eb85b7daa7c117fc8b5bf87";
        hash = "sha256-ytQU6fmD13UGKlhbYq0WhC1KBdHZXHsuK7M+iNihXkk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ament_index_cpp";
  version = "1.8.1-1";
  src = sources.ament_index_cpp;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [  ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "C++ API to access the ament resource index.";
  };
}
