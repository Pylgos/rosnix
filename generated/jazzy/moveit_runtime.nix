{
  ament_cmake,
  buildRosPackage,
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
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_runtime = substituteSource {
      src = fetchgit {
        name = "moveit_runtime-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "2ddde4274e5e80ea818897525648caaf6cdd54ac";
        hash = "sha256-SR3G7cM+iKdHJI3TKxLIjvWalU7z2ah5YPtuF295yGk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_runtime";
  version = "2.10.0-1";
  src = sources.moveit_runtime;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ moveit_core moveit_planners moveit_plugins moveit_ros_move_group moveit_ros_perception moveit_ros_planning moveit_ros_planning_interface moveit_ros_warehouse ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "moveit_runtime meta package contains MoveIt packages that are essential for its runtime (e.g. running MoveIt on robots).";
  };
}
