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
  substituteSource,
}:
let
  sources = rec {
    ouxt_lint_common = substituteSource {
      src = fetchgit {
        name = "ouxt_lint_common-source";
        url = "https://github.com/ros2-gbp/ouxt_common-release.git";
        rev = "a35557bf5c608feca2e51f06e373948fc275c67a";
        hash = "sha256-CzvbzrJWL16B2/c63ryLS008hT4dSu50P4AhU+lsHpQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ouxt_lint_common";
  version = "0.0.8-4";
  src = sources.ouxt_lint_common;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ ament_cmake_copyright ament_cmake_pep257 ament_cmake_xmllint ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_cmake_clang_format ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "common linter settings for OUXT Polaris ROS2 packages";
  };
}
