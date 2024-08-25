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
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_controllers = substituteSource {
      src = fetchgit {
        name = "moveit_setup_controllers-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "876461754a58bfb5e8b572211dfdd5aaed93dfb6";
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
  src = sources.moveit_setup_controllers;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp moveit_setup_framework pluginlib rclcpp ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest moveit_configs_utils moveit_resources_fanuc_moveit_config moveit_resources_panda_moveit_config ];
  missingDependencies = [  ];
  meta = {
    description = "MoveIt Setup Steps for ROS 2 Control";
  };
}
