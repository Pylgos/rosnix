{
  ament_cmake,
  ament_cmake_gmock,
  buildRosPackage,
  eigen3_cmake_module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric_shapes,
  moveit_common,
  moveit_core,
  moveit_msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2_ros,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    moveit_ros_occupancy_map_monitor-6ab5e07eb5f5945162f845d32c84b7c8ce827ab4 = substituteSource {
      src = fetchgit {
        name = "moveit_ros_occupancy_map_monitor-6ab5e07eb5f5945162f845d32c84b7c8ce827ab4-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "6ab5e07eb5f5945162f845d32c84b7c8ce827ab4";
        hash = "sha256-WHbMOwEkQoPOrHQOeH/0GJyEa7g/ez3LJsJTZw6jUUw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.10.0-1";
  src = sources.moveit_ros_occupancy_map_monitor-6ab5e07eb5f5945162f845d32c84b7c8ce827ab4;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ eigen3_cmake_module ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometric_shapes moveit_common moveit_core moveit_msgs pluginlib rclcpp tf2_ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gmock ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
}
