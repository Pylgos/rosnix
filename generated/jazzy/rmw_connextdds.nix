{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  rmw_connextdds_common,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds = substituteSource {
      src = fetchFromGitHub {
        name = "rmw_connextdds-source";
        owner = "ros2-gbp";
        repo = "rmw_connextdds-release";
        rev = "c66b73f5ee1d30f38d77a8c9ce854754bd56ff1f";
        hash = "sha256-Jrjpk82Ee3GTqvyLSRQt/mMnMAxxBxQkcV27miew8cM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.22.0-2";
  src = sources.rmw_connextdds;
  nativeBuildInputs = [ ament_cmake_ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rmw_connextdds_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A ROS 2 RMW implementation built with RTI Connext DDS Professional.";
  };
}
