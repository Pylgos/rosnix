{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  grid_map_cmake_helpers,
  grid_map_core,
  grid_map_cv,
  grid_map_filters,
  grid_map_loader,
  grid_map_msgs,
  grid_map_octomap,
  grid_map_ros,
  grid_map_rviz_plugin,
  grid_map_visualization,
  octomap_msgs,
  octomap_rviz_plugins,
  octomap_server,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz2,
  sensor_msgs,
  substituteSource,
  wrapRosQtAppsHook,
}:
let
  sources = rec {
    grid_map_demos = substituteSource {
      src = fetchgit {
        name = "grid_map_demos-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "f8ef8b26e250de7ad625a5cfbde7d95e4ee82690";
        hash = "sha256-1hNk5OqnoIp2LALotd5QPxfUP/Mc9QZMQeMYJNi6f1I=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_demos";
  version = "2.2.0-1";
  src = sources.grid_map_demos;
  nativeBuildInputs = [ ament_cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs grid_map_cmake_helpers grid_map_core grid_map_cv grid_map_filters grid_map_loader grid_map_msgs grid_map_octomap grid_map_ros grid_map_rviz_plugin grid_map_visualization octomap_msgs octomap_rviz_plugins octomap_server rclcpp rclpy rviz2 sensor_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-opencv" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Demo nodes to demonstrate the usage of the grid map library.";
  };
}
