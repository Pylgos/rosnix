{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  moveit_resources_prbt_ikfast_manipulator_plugin,
  moveit_resources_prbt_support,
  moveit_ros_move_group,
  robot_state_publisher,
  rviz2,
  substituteSource,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_resources_prbt_moveit_config = substituteSource {
      src = fetchgit {
        name = "moveit_resources_prbt_moveit_config-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "15a544dc6a048ff10a4247a6ed64ae8c7cfa9c8d";
        hash = "sha256-PIPewmh2T1boe+I/jVlC1Weg6gP4O+52b6sazqkllTA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.10.0-1";
  src = sources.moveit_resources_prbt_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_support moveit_ros_move_group robot_state_publisher rviz2 xacro ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "";
  };
}
