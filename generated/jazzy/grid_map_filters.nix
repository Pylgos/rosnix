{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  pluginlib,
  substituteSource,
  tbb,
}:
let
  sources = rec {
    grid_map_filters = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "f94980e5405c1ba21c7187f3b17629d6c9b0a04a";
        hash = "sha256-ckMZDVEk435pl5NW+PLvvGC0A38wDWfItz09kpEoftQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_filters";
  version = "2.2.0-1";
  src = sources.grid_map_filters;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ filters grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros pluginlib tbb ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Processing grid maps as a sequence of ROS filters.";
  };
}
