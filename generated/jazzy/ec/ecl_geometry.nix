{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_containers,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_linear_algebra,
  ecl_math,
  ecl_mpl,
  ecl_type_traits,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_geometry-88fb603dc11bb212904342a75158fdbad487a916 = substituteSource {
      src = fetchgit {
        name = "ecl_geometry-88fb603dc11bb212904342a75158fdbad487a916-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "88fb603dc11bb212904342a75158fdbad487a916";
        hash = "sha256-XXr9pl1hLn7gS04rAzdTRXa+Fe0p4Mn7sC0scLWC2Zc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_geometry";
  version = "1.2.1-5";
  src = sources.ecl_geometry-88fb603dc11bb212904342a75158fdbad487a916;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_containers ecl_exceptions ecl_formatters ecl_license ecl_linear_algebra ecl_math ecl_mpl ecl_type_traits ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Any tools relating to mathematical geometry. Primarily featuring polynomials and interpolations.";
  };
}
