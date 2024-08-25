{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_converters,
  ecl_errors,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_mpl,
  ecl_type_traits,
  ecl_utilities,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
}:
let
  sources = rec {
    ecl_containers = substituteSource {
      src = fetchgit {
        name = "ecl_containers-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "b06753c443575d5f82ed4a98aa1933c674737437";
        hash = "sha256-943O8bp1zs58toB05o+e+e5rOiiB7i0OAWEjrbjQ7Ng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_containers";
  version = "1.2.1-5";
  src = sources.ecl_containers;
  nativeBuildInputs = [ ament_cmake_ros ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ecl_build ecl_config ecl_converters ecl_errors ecl_exceptions ecl_formatters ecl_license ecl_mpl ecl_type_traits ecl_utilities ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "The containers included here are intended to extend the stl containers. In all cases, these implementations are designed to implement c++ conveniences and safety where speed is not sacrificed. Also includes techniques for memory debugging of common problems such as buffer overruns.";
  };
}
