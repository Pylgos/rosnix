{
  ament_cmake,
  buildRosPackage,
  controller_manager,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  joint_state_publisher,
  joint_state_publisher_gui,
  kortex_description,
  moveit_configs_utils,
  moveit_kinematics,
  moveit_planners,
  moveit_ros_move_group,
  moveit_ros_visualization,
  moveit_ros_warehouse,
  moveit_setup_assistant,
  moveit_simple_controller_manager,
  picknik_reset_fault_controller,
  picknik_twist_controller,
  robot_state_publisher,
  rosSystemPackages,
  rviz2,
  rviz_common,
  rviz_default_plugins,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    kinova_gen3_6dof_robotiq_2f_85_moveit_config = substituteSource {
      src = fetchFromGitHub {
        name = "kinova_gen3_6dof_robotiq_2f_85_moveit_config-source";
        owner = "ros2-gbp";
        repo = "ros2_kortex-release";
        rev = "722945bae56c914fde6933db7aca9bb8af9d7ba5";
        hash = "sha256-9CNjT91s8BP6jCVjUKgia6mjRUPVRuszO8R/fBh7vnU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "kinova_gen3_6dof_robotiq_2f_85_moveit_config";
  version = "0.2.2-2";
  src = sources.kinova_gen3_6dof_robotiq_2f_85_moveit_config;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ controller_manager joint_state_publisher joint_state_publisher_gui kortex_description moveit_configs_utils moveit_kinematics moveit_planners moveit_ros_move_group moveit_ros_visualization moveit_ros_warehouse moveit_setup_assistant moveit_simple_controller_manager picknik_reset_fault_controller picknik_twist_controller robot_state_publisher rviz2 rviz_common rviz_default_plugins tf2_ros xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "An automatically generated package with all the configuration and launch files for using the gen3 with the MoveIt Motion Planning Framework";
  };
}
