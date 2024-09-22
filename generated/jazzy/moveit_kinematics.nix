{
  ament_cmake,
  ament_cmake_gtest,
  buildRosPackage,
  class_loader,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  generate_parameter_library,
  launch_param_builder,
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
  sources = rec {
    moveit_kinematics = substituteSource {
      src = fetchFromGitHub {
        name = "moveit_kinematics-source";
        owner = "ros2-gbp";
        repo = "moveit2-release";
        rev = "e6bac77b77b63caf01dda902c3d3c38b8de6cc18";
        hash = "sha256-hseesEOBXSfOj36mGIbEmGSddLotrO+orC8BkjQnkzw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_kinematics";
  version = "2.10.0-1";
  src = sources.moveit_kinematics;
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
