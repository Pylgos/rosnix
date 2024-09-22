{
  ament_cmake,
  ament_cmake_auto,
  ament_cmake_gtest,
  ament_cmake_pclint,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
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
      src = fetchgit {
        name = "apex_test_tools-source";
        url = "https://github.com/ros2-gbp/apex_test_tools-release.git";
        rev = "1de070b1ce7d0efb9a77e69eac2e17a3f1f3d212";
        hash = "sha256-vrX5LngYVt0Fxd0td4idUCVPg+j96W7S07zUG/lM8W4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "apex_test_tools";
  version = "0.0.2-9";
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
