{
  ament_cmake,
  ament_cmake_ros,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rmw_connextdds_common,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    rmw_connextdds-0df16e1089d13ff22ef9d8048f3d81abbdf9ef84 = substituteSource {
      src = fetchgit {
        name = "rmw_connextdds-0df16e1089d13ff22ef9d8048f3d81abbdf9ef84-source";
        url = "https://github.com/ros2-gbp/rmw_connextdds-release.git";
        rev = "0df16e1089d13ff22ef9d8048f3d81abbdf9ef84";
        hash = "sha256-yP2MzcNcR8q/RckoH93GlvMs8YXyv7jBnlizE9o0mDs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmw_connextdds";
  version = "0.24.1-1";
  src = sources.rmw_connextdds-0df16e1089d13ff22ef9d8048f3d81abbdf9ef84;
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
