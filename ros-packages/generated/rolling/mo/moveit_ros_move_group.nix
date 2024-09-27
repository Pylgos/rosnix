{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_kinematics,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_ros_occupancy_map_monitor,
  moveit_ros_planning,
  pluginlib,
  rclcpp,
  rclcpp_action,
  rosSystemPackages,
  ros_testing,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_move_group-1ccea2726e203bc1cd13f79f0af74f4775a12727 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_move_group-1ccea2726e203bc1cd13f79f0af74f4775a12727-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "1ccea2726e203bc1cd13f79f0af74f4775a12727";
        hash = "sha256-ojnDFjRlABmP5WrWGQY2cJBLNCdncMPK1to3IcphMrA=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_move_group";
  version = "2.11.0-1";
  src = sources.moveit_ros_move_group-1ccea2726e203bc1cd13f79f0af74f4775a12727;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ moveit_common moveit_core moveit_kinematics moveit_ros_occupancy_map_monitor moveit_ros_planning pluginlib rclcpp rclcpp_action std_srvs tf2 tf2_geometry_msgs tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "fmt" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_configs_utils moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "The move_group node for MoveIt";
  };
}
