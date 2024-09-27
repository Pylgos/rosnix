{
  ament_cmake,
  ament_cmake_gtest,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_configs_utils,
  moveit_resources_panda_moveit_config,
  moveit_setup_app_plugins,
  moveit_setup_controllers,
  moveit_setup_core_plugins,
  moveit_setup_framework,
  moveit_setup_srdf_plugins,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_assistant-f7757999faf4a83bf5edfe6b9173f68f5ae3eded = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-f7757999faf4a83bf5edfe6b9173f68f5ae3eded-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "f7757999faf4a83bf5edfe6b9173f68f5ae3eded";
        hash = "sha256-5idmqvp9XuS4nBJLzXsLmKu8qHJDOFq0KNVIK+4xWXU=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_assistant";
  version = "2.11.0-1";
  src = sources.moveit_setup_assistant-f7757999faf4a83bf5edfe6b9173f68f5ae3eded;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament_index_cpp moveit_configs_utils moveit_setup_app_plugins moveit_setup_controllers moveit_setup_core_plugins moveit_setup_framework moveit_setup_srdf_plugins pluginlib rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qtbase5-dev" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest moveit_resources_panda_moveit_config ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
}
