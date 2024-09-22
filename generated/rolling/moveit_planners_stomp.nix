{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  moveit_common,
  moveit_core,
  rosSystemPackages,
  rsl,
  std_msgs,
  stomp,
  substituteSource,
  tf2_eigen,
  visualization_msgs,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners_stomp = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_planners_stomp-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "f1e38b6d56c4b15cd8bb7ff0a84af095f5ed9f63";
        hash = "sha256-L29LvKMnWBk2T8FOsIVXLSPCbCWF710ujk+dC0u/ypA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_stomp";
  version = "2.11.0-1";
  src = sources.moveit_planners_stomp;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library moveit_common moveit_core rsl std_msgs stomp tf2_eigen visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
}
