{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ament_index_cpp-3c5dd9ddaad1ddb13eb85b7daa7c117fc8b5bf87 = substituteSource {
      src = fetchgit {
        name = "ament_index_cpp-3c5dd9ddaad1ddb13eb85b7daa7c117fc8b5bf87-source";
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
  src = sources.ament_index_cpp-3c5dd9ddaad1ddb13eb85b7daa7c117fc8b5bf87;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "C++ API to access the ament resource index.";
  };
}
