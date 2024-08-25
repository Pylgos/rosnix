{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_concepts = substituteSource {
      src = fetchgit {
        name = "ecl_concepts-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "072809e1b60a07ee959d2a013e5a6a49323e8d51";
        hash = "sha256-hH2MIha8e5l0G1CqvBSjisV52RKAkaE0J9ZtGpxM9EM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_concepts";
  version = "1.2.1-4";
  src = sources.ecl_concepts;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Introduces a compile time concept checking mechanism that can be used most commonly to check for required functionality when passing template arguments.";
  };
}
