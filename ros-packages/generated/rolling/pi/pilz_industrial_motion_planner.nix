{
  ament_cmake,
  ament_cmake_gmock,
  ament_cmake_gtest,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  geometry_msgs,
  launch_param_builder,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_panda_moveit_config,
  moveit_resources_prbt_moveit_config,
  moveit_resources_prbt_pg70_support,
  moveit_resources_prbt_support,
  moveit_ros_move_group,
  moveit_ros_planning,
  orocos_kdl_vendor,
  pilz_industrial_motion_planner_testutils,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  ros_testing,
  substituteSource,
  tf2,
  tf2_eigen,
  tf2_eigen_kdl,
  tf2_geometry_msgs,
  tf2_kdl,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    pilz_industrial_motion_planner-6c4e09661847e7e58281c4b9781ba4cf7469e3a8 = substituteSource {
      src = fetchgit {
        name = "pilz_industrial_motion_planner-6c4e09661847e7e58281c4b9781ba4cf7469e3a8-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6c4e09661847e7e58281c4b9781ba4cf7469e3a8";
        hash = "sha256-RSFyg5wm+9tWtBgOD5RaB8k0P6n+77DZ6lMbVpB9GeI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "pilz_industrial_motion_planner";
  version = "2.11.0-1";
  src = sources.pilz_industrial_motion_planner-6c4e09661847e7e58281c4b9781ba4cf7469e3a8;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ generate_parameter_library geometry_msgs moveit_common moveit_core moveit_msgs moveit_ros_move_group moveit_ros_planning orocos_kdl_vendor pluginlib rclcpp tf2 tf2_eigen tf2_eigen_kdl tf2_geometry_msgs tf2_kdl tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ament_cmake_gtest launch_param_builder moveit_configs_utils moveit_resources_panda_moveit_config moveit_resources_prbt_moveit_config moveit_resources_prbt_pg70_support moveit_resources_prbt_support pilz_industrial_motion_planner_testutils ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  meta = {
    description = "MoveIt plugin to generate industrial trajectories PTP, LIN, CIRC and sequences thereof.";
  };
}
