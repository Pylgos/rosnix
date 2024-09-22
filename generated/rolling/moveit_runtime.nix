{
  ament_cmake,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_core,
  moveit_planners,
  moveit_plugins,
  moveit_ros_move_group,
  moveit_ros_perception,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_ros_warehouse,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_runtime = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_runtime-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "32a8312a2e20c97bace391d9e22ee50145f3ffe2";
        hash = "sha256-5ymjMEdLHYJ9JxxIRz90pByEsJDF+2yV1WzH5TdDbic=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_runtime";
  version = "2.11.0-1";
  src = sources.moveit_runtime;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros_move_group moveit_ros_perception moveit_ros_planning moveit_ros_planning_interface moveit_ros_warehouse ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
}
