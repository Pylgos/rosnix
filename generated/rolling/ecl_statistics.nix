{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_license,
  ecl_linear_algebra,
  ecl_mpl,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_statistics = substituteSource {
      src = fetchgit {
        name = "ecl_statistics-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "c0e8d8dd7d93057ac24bd8beac89d9212a1a99a2";
        hash = "sha256-znVdvA/1rSX25k4ZeeWg3ageP91ua9cDRosJ2FCTUyo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_statistics";
  version = "1.2.1-4";
  src = sources.ecl_statistics;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_license ecl_linear_algebra ecl_mpl ecl_type_traits ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Common statistical structures and algorithms for control systems.";
  };
}
