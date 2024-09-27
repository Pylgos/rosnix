{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_planners_ompl,
  moveit_planners_stomp,
  pilz_industrial_motion_planner,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_planners-52849597ee1e7579bd26f4d857e96fd813815e1e = substituteSource {
      src = fetchgit {
        name = "moveit_planners-52849597ee1e7579bd26f4d857e96fd813815e1e-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "52849597ee1e7579bd26f4d857e96fd813815e1e";
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
  src = sources.moveit_planners-52849597ee1e7579bd26f4d857e96fd813815e1e;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_planners_ompl moveit_planners_stomp pilz_industrial_motion_planner ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Meta package that installs all available planners for MoveIt";
  };
}
