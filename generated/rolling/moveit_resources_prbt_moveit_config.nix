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
  rosSystemPackages,
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
        rev = "a908453a73c0fa47f86cf0fed06767778c05fef2";
        hash = "sha256-tkXqraDt7iURYP8Cu9Gw0UL3MGWQFkj34yRTM2w6zmc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_resources_prbt_moveit_config";
  version = "2.11.0-1";
  src = sources.moveit_resources_prbt_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ joint_state_publisher moveit_resources_prbt_ikfast_manipulator_plugin moveit_resources_prbt_support moveit_ros_move_group robot_state_publisher rviz2 xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "";
  };
}
