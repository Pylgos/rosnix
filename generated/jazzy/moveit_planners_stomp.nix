{
  ament_cmake,
  buildRosPackage,
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
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7a1d93e2b0eacdf13cb8e2dfaf76e4211c17422b";
        hash = "sha256-EgW89h7du3ms3jp8R5zyUq8/S0pCauPOEUcwWkEyJ3Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners_stomp";
  version = "2.10.0-1";
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
