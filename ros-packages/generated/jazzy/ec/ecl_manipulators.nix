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
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    ecl_manipulators-918c1d66427daaa5f9454b3fc53b1e5125c80a22 = substituteSource {
      src = fetchgit {
        name = "ecl_manipulators-918c1d66427daaa5f9454b3fc53b1e5125c80a22-source";
        url = "https://github.com/ros2-gbp/ecl_core-release.git";
        rev = "918c1d66427daaa5f9454b3fc53b1e5125c80a22";
        hash = "sha256-O2B7UtubuHvctssWyG6E5OwnApjjdWF+m62+6Da9Qy4=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ecl_manipulators";
  version = "1.2.1-5";
  src = sources.ecl_manipulators-918c1d66427daaa5f9454b3fc53b1e5125c80a22;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ecl_build ecl_exceptions ecl_formatters ecl_geometry ecl_license ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Deploys various manipulation algorithms, currently just feedforward filters (interpolations).";
  };
}
