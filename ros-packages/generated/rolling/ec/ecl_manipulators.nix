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
    ecl_manipulators-fc7cd14e6eb5aae61165e3c575bbc66553519a91 = substituteSource {
      src = fetchgit {
        name = "ecl_manipulators-fc7cd14e6eb5aae61165e3c575bbc66553519a91-source";
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
  src = sources.ecl_manipulators-fc7cd14e6eb5aae61165e3c575bbc66553519a91;
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
