{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_planners_chomp,
  moveit_planners_ompl,
  moveit_planners_stomp,
  moveit_resources_panda_moveit_config,
  moveit_ros_move_group,
  moveit_ros_planning,
  moveit_ros_planning_interface,
  moveit_simple_controller_manager,
  pilz_industrial_motion_planner,
  rclcpp,
  rosSystemPackages,
  ros_testing,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_tests = substituteSource {
      src = fetchgit {
        name = "moveit_ros_tests-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "40e1a8e5bbf46adfa048f32e521f4ad562ff2aad";
        hash = "sha256-zF+FM49Zy2BIqw6NryJaExzV8DedI21dwPXQYEeysO0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_tests";
  version = "2.11.0-1";
  src = sources.moveit_ros_tests;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_common rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto moveit_configs_utils moveit_core moveit_planners_chomp moveit_planners_ompl moveit_planners_stomp moveit_resources_panda_moveit_config moveit_ros_move_group moveit_ros_planning moveit_ros_planning_interface moveit_simple_controller_manager pilz_industrial_motion_planner ros_testing tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Integration tests for moveit_ros";
  };
}
