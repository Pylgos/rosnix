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
  rosSystemPackages,
  substituteSource,
  vision_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    rmf_visualization_obstacles-c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c-source";
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
  src = sources.rmf_visualization_obstacles-c75a9e1ed2868e34b13e8dffedd0bbd7e07ac56c;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry_msgs rclcpp rclcpp_components rmf_obstacle_msgs rmf_visualization_msgs vision_msgs visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_uncrustify rmf_utils ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "A visualizer for obstacles in RMF";
  };
}
