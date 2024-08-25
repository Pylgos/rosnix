{
  ament_cmake,
  ament_cmake_uncrustify,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  rclcpp,
  rclcpp_components,
  rmf_obstacle_msgs,
  rmf_utils,
  rmf_visualization_msgs,
  substituteSource,
  vision_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_obstacles = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c";
        hash = "sha256-Zr/9GdPOB+2XnT7jgy9505tsIxS44QbsZHsqS0drSgM=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_obstacles";
  version = "2.4.0-1";
  src = sources.rmf_visualization_obstacles;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_obstacle_msgs rmf_visualization_msgs vision_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_uncrustify rmf_utils ];
  missingDependencies = [  ];
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
}
