{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_msgs,
  grid_map_ros,
  nav_msgs,
  rclcpp,
  sensor_msgs,
  substituteSource,
  visualization_msgs,
}:
let
  sources = rec {
    grid_map_visualization = substituteSource {
      src = fetchgit {
        name = "grid_map_visualization-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "0d0cdbb5cadab70f2faa0856516fb16dc550064f";
        hash = "sha256-I9+vHktSuhz0zAuexaejiink+j4aatz9Oz5Lkk4r4Bk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_visualization";
  version = "2.2.0-1";
  src = sources.grid_map_visualization;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ grid_map_cmake_helpers grid_map_core grid_map_msgs grid_map_ros nav_msgs rclcpp sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "Configurable tool to visualize grid maps in RViz.";
  };
}
