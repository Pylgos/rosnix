{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_concepts,
  ecl_license,
  ecl_mpl,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_utilities = substituteSource {
      src = fetchgit {
        name = "ecl_utilities-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "db3973b3cbdd6aa51da4b02d2a91b66b605650e1";
        hash = "sha256-lr/gRtkjgtYbXIMwa5OUbaSehxs5kKRTATWgZooFnRA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_utilities";
  version = "1.2.1-4";
  src = sources.ecl_utilities;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_concepts ecl_license ecl_mpl ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Includes various supporting tools and utilities for c++ programming.";
  };
}
