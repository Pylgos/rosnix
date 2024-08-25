{
  ament_cmake,
  ament_index_cpp,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  moveit_ros_visualization,
  moveit_setup_framework,
  pluginlib,
  rclcpp,
  srdfdom,
  substituteSource,
  urdf,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_setup_core_plugins = substituteSource {
      src = fetchgit {
        name = "moveit_setup_core_plugins-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "b35f7e2ce0d21346b15f0ae282f3a89cf4cb0b69";
        hash = "sha256-zu0imYmCxzAZeYZhj925AlKQbSyYk3L+0kr0pIJkiyw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_setup_core_plugins";
  version = "2.10.0-1";
  src = sources.moveit_setup_core_plugins;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_cpp moveit_ros_visualization moveit_setup_framework pluginlib rclcpp srdfdom urdf ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Core (meta) plugins for MoveIt Setup Assistant";
  };
}
