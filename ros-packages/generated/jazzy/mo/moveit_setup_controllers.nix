{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_resources_fanuc_moveit_config,
  moveit_resources_panda_moveit_config,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_controllers-ebab99912374cff2100a3f9efc20fdd3ae1ba654 = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-ebab99912374cff2100a3f9efc20fdd3ae1ba654-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ebab99912374cff2100a3f9efc20fdd3ae1ba654";
        hash = "sha256-zvscEXuZnQ5Iz08FIIvh8kcnJcoRoKGt/jBrky0tHfM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_controllers";
  version = "2.10.0-1";
  src = sources.moveit_setup_controllers-ebab99912374cff2100a3f9efc20fdd3ae1ba654;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp moveit_setup_framework pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_configs_utils moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
}
