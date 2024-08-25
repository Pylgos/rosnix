{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_msgs,
  grid_map_ros,
  qt5,
  rclcpp,
  rviz_common,
  rviz_ogre_vendor,
  rviz_rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map_rviz_plugin = substituteSource {
      src = fetchgit {
        name = "grid_map_rviz_plugin-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b347fa11e021fd9fc2e74c93f3e58ef9080afc72";
        hash = "sha256-DAioUw7W4LJs4Pt/ZYANnFiCDBerU3Rbnk7Ql3LEq7w=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_rviz_plugin";
  version = "2.2.0-1";
  src = sources.grid_map_rviz_plugin;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_msgs grid_map_ros qt5.qtbase rclcpp rviz_common rviz_ogre_vendor rviz_rendering ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "RViz plugin for displaying grid map messages.";
  };
}
