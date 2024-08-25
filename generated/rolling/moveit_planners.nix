{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_planners_ompl,
  moveit_planners_stomp,
  pilz_industrial_motion_planner,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners = substituteSource {
      src = fetchgit {
        name = "moveit_planners-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7b89b5b381da67d4a6b60f7442418bb0f563222c";
        hash = "sha256-tHhEg3jwekHAsyucoYE+gFnMw+bCXkrKzo++Lkpf0So=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_planners";
  version = "2.10.0-1";
  src = sources.moveit_planners;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_planners_ompl moveit_planners_stomp pilz_industrial_motion_planner ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
}
