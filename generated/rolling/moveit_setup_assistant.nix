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
  qt5,
  rclcpp,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_assistant = substituteSource {
      src = fetchgit {
        name = "moveit_setup_assistant-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "e6cca4ebcc221775b6ef92b6d17cce31712962ae";
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
  src = sources.moveit_setup_assistant;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp moveit_configs_utils moveit_setup_app_plugins moveit_setup_controllers moveit_setup_core_plugins moveit_setup_framework moveit_setup_srdf_plugins pluginlib qt5.qtbase rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest moveit_resources_panda_moveit_config ];
  missingDependencies = [  ];
  meta = {
    description = "Generates a configuration package that makes it easy to use MoveIt";
  };
}
