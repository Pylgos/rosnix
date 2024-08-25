{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_costmap_2d,
  grid_map_cv,
  grid_map_demos,
  grid_map_filters,
  grid_map_loader,
  grid_map_msgs,
  grid_map_octomap,
  grid_map_pcl,
  grid_map_ros,
  grid_map_rviz_plugin,
  grid_map_sdf,
  grid_map_visualization,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map = substituteSource {
      src = fetchgit {
        name = "grid_map-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "19690009ed1768c25a09a4c60d40a8ded52f3878";
        hash = "sha256-UDD+yaCrVCJ7CRgcWz9eNZ7foYmtVwX4JxVlJlrE1A0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map";
  version = "2.2.0-1";
  src = sources.grid_map;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_costmap_2d grid_map_cv grid_map_demos grid_map_filters grid_map_loader grid_map_msgs grid_map_octomap grid_map_pcl grid_map_ros grid_map_rviz_plugin grid_map_sdf grid_map_visualization ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "Meta-package for the universal grid map library.";
  };
}
