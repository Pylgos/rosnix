{
  ament-cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  generate-parameter-library,
  mkSourceSet,
  moveit-common,
  moveit-core,
  rosSystemPackages,
  rsl,
  std-msgs,
  stomp,
  substituteSource,
  tf2-eigen,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_planners_stomp" = substituteSource {
      src = fetchgit {
        name = "moveit_planners_stomp-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7a1d93e2b0eacdf13cb8e2dfaf76e4211c17422b";
        hash = "sha256-EgW89h7du3ms3jp8R5zyUq8/S0pCauPOEUcwWkEyJ3Q=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_planners_stomp";
  version = "2.10.0-1";
  src = sources."moveit_planners_stomp";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate-parameter-library moveit-common moveit-core rsl std-msgs stomp tf2-eigen visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "STOMP Motion Planner for MoveIt";
  };
}
