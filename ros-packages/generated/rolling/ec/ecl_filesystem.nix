{
  ament_cmake_gtest,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  ecl_build,
  ecl_config,
  ecl_errors,
  ecl_license,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ecl_filesystem" = substituteSource {
      src = fetchgit {
        name = "ecl_filesystem-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "7eeb996fdf1ce9b772d96d640fca9e3bd538b96d";
        hash = "sha256-b9AmUCVBFQ84JFx0ER/eD+2NF6JP/zybtNFnzKAI+dg=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ecl_filesystem";
  version = "1.2.1-4";
  src = sources."ecl_filesystem";
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_config ecl_errors ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Cross platform filesystem utilities (until c++11 makes its way in).";
  };
}
