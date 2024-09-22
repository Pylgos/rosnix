{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_cmake_pclint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  osrf_testing_tools_cpp,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    apex_test_tools = substituteSource {
      src = fetchFromGitHub {
        name = "apex_test_tools-source";
        owner = "ros2-gbp";
        repo = "apex_test_tools-release";
        rev = "4a87b1c634be29109bcf30218c6177c096fced98";
        hash = "sha256-vrX5LngYVt0Fxd0td4idUCVPg+j96W7S07zUG/lM8W4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apex_test_tools";
  version = "0.0.2-8";
  src = sources.apex_test_tools;
  nativeBuildInputs = [ ament_cmake ament_cmake_auto ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_gtest ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ osrf_testing_tools_cpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pclint ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The package Apex.OS Test Tools contains test helpers";
  };
}
