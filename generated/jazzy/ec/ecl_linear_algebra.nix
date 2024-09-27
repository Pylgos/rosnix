{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_converters,
  ecl_eigen,
  ecl_exceptions,
  ecl_formatters,
  ecl_license,
  ecl_math,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  sophus,
  substituteSource,
}:
let
  sources = rec {
    ecl_linear_algebra-67190a8dea831f2c6b0ebf36d232d4bf5b9b58c0 = substituteSource {
      src = fetchgit {
        name = "ecl_linear_algebra-67190a8dea831f2c6b0ebf36d232d4bf5b9b58c0-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "67190a8dea831f2c6b0ebf36d232d4bf5b9b58c0";
        hash = "sha256-2Mofxug8ckLfTnStaTQtx69z6SvToiY8incBV3OMXJo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_linear_algebra";
  version = "1.2.1-5";
  src = sources.ecl_linear_algebra-67190a8dea831f2c6b0ebf36d232d4bf5b9b58c0;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_converters ecl_eigen ecl_exceptions ecl_formatters ecl_license ecl_math sophus ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Ecl frontend to a linear matrix package (currently eigen).";
  };
}
