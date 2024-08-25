{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_exceptions,
  ecl_formatters,
  ecl_geometry,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_manipulators = substituteSource {
      src = fetchgit {
        name = "ecl_manipulators-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "fc7cd14e6eb5aae61165e3c575bbc66553519a91";
        hash = "sha256-O2B7UtubuHvctssWyG6E5OwnApjjdWF+m62+6Da9Qy4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_manipulators";
  version = "1.2.1-4";
  src = sources.ecl_manipulators;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_exceptions ecl_formatters ecl_geometry ecl_license ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Deploys various manipulation algorithms, currently just feedforward filters (interpolations).";
  };
}
