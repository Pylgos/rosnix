{
  ament_cmake,
  ament_cmake_clang_format,
  ament_cmake_copyright,
  ament_cmake_pep257,
  ament_cmake_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ouxt_lint_common = substituteSource {
      src = fetchgit {
        name = "ouxt_lint_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "9df07eae34ba86ab0378e1fbcd9c5aedea232362";
        hash = "sha256-CzvbzrJWL16B2/c63ryLS008hT4dSu50P4AhU+lsHpQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouxt_lint_common";
  version = "0.0.8-5";
  src = sources.ouxt_lint_common;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake_copyright ament_cmake_pep257 ament_cmake_xmllint ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_cmake_clang_format ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "common linter settings for OUXT Polaris ROS2 packages";
  };
}
