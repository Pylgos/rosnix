{
  ament_cmake,
  ament_cmake_pytest,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch_pytest,
  launch_testing_ament_cmake,
  moveit_common,
  moveit_configs_utils,
  moveit_planners_ompl,
  moveit_resources,
  moveit_ros,
  moveit_ros_planning_interface,
  rclcpp,
  rclcpp_action,
  rmf_utils,
  robot_state_publisher,
  ros2_control,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  trajectory_msgs,
  warehouse_ros_sqlite,
  wrapRosQtAppsHook,
  xacro,
}:
let
  sources = rec {
    moveit_ros_trajectory_cache = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_ros_trajectory_cache-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "52dcc3bcb278818529a53271eaf6437f45fa05e4";
        hash = "sha256-uy4MQ2Y9O3j6x0ti5PIxjE09zuvxcGiwPfFCSXT/S3Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_trajectory_cache";
  version = "2.11.0-1";
  src = sources.moveit_ros_trajectory_cache;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs moveit_common moveit_ros moveit_ros_planning_interface rclcpp rclcpp_action tf2_ros trajectory_msgs xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_pytest ament_cmake_uncrustify launch_pytest launch_testing_ament_cmake moveit_configs_utils moveit_planners_ompl moveit_resources rmf_utils robot_state_publisher ros2_control warehouse_ros_sqlite ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "A trajectory cache for MoveIt 2 motion plans and cartesian plans.";
  };
}
