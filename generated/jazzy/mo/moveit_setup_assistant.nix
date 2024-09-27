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
    moveit_setup_assistant-7237ec22571e5e59ca619e26270d7bb0ffc38446 = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-7237ec22571e5e59ca619e26270d7bb0ffc38446-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "7237ec22571e5e59ca619e26270d7bb0ffc38446";
        hash = "sha256-NSji7+ZlJPetoyTGf8EL+tktqrNMizkfwp/KmM/V6xo=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_assistant";
  version = "2.10.0-1";
  src = sources.moveit_setup_assistant-7237ec22571e5e59ca619e26270d7bb0ffc38446;
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
