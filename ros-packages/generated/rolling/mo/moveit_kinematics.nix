{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  class_loader,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  launch_param_builder,
  mkSourceSet,
  moveit_common,
  moveit_configs_utils,
  moveit_core,
  moveit_msgs,
  moveit_resources_fanuc_description,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_description,
  moveit_resources_panda_moveit_config,
  moveit_ros_planning,
  orocos_kdl_vendor,
  pluginlib,
  rosSystemPackages,
  ros_testing,
  rsl,
  substituteSource,
  tf2,
  tf2_kdl,
  urdfdom,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "moveit_kinematics" = substituteSource {
      src = fetchgit {
        name = "moveit_kinematics-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ad6c1a289ece21355b0b717e5cabd21915665903";
        hash = "sha256-Mhpc2gWYdDYx5WAAiWCrFpwI/36NUkZi3YNLlzEZVjo=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.11.0-1";
  src = sources."moveit_kinematics";
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ class_loader generate_parameter_library moveit_common moveit_core moveit_msgs moveit_ros_planning orocos_kdl_vendor pluginlib rsl tf2 tf2_kdl urdfdom ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "python3-lxml" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest launch_param_builder moveit_configs_utils moveit_resources_fanuc_description moveit_resources_fanuc_moveit_config moveit_resources_panda_description moveit_resources_panda_moveit_config ros_testing ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Package for all inverse kinematics solvers in MoveIt";
  };
}
