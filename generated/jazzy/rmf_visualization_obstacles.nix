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
    rmf_visualization_obstacles = substituteSource {
      src = fetchgit {
        name = "rmf_visualization_obstacles-source";
        url = "https://github.com/ros2-gbp/rmf_visualization-release.git";
        rev = "ea5997876c9e316df71b29cb446ba5299b768c7c";
        hash = "sha256-Cu1rClmXAp3Zuzc5DhsHEau7XqrwfIKFKHXhFHYXU0U=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rmf_visualization_obstacles";
  version = "2.3.2-1";
  src = sources.rmf_visualization_obstacles;
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
