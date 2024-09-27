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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_containers-892731f8c4692aee85993224927d18c845dfe360 = substituteSource {
      src = fetchgit {
        name = "ecl_containers-892731f8c4692aee85993224927d18c845dfe360-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "892731f8c4692aee85993224927d18c845dfe360";
        hash = "sha256-943O8bp1zs58toB05o+e+e5rOiiB7i0OAWEjrbjQ7Ng=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_containers";
  version = "1.2.1-4";
  src = sources.ecl_containers-892731f8c4692aee85993224927d18c845dfe360;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_converters ecl_errors ecl_exceptions ecl_formatters ecl_license ecl_mpl ecl_type_traits ecl_utilities ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The containers included here are intended to extend the stl containers. In all cases, these implementations are designed to implement c++ conveniences and safety where speed is not sacrificed. Also includes techniques for memory debugging of common problems such as buffer overruns.";
  };
}
