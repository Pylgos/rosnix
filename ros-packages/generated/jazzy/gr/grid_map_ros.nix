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
  grid_map_msgs,
  nav2_msgs,
  nav_msgs,
  rclcpp,
  rcutils,
  rosSystemPackages,
  rosbag2_cpp,
  sensor_msgs,
  std_msgs,
  substituteSource,
  tf2,
  visualization_msgs,
}:
let
  sources = rec {
    grid_map_ros-d89403d076f057c0b23285d8d5a13d75a823f1e7 = substituteSource {
      src = fetchgit {
        name = "grid_map_ros-d89403d076f057c0b23285d8d5a13d75a823f1e7-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "d89403d076f057c0b23285d8d5a13d75a823f1e7";
        hash = "sha256-sDBJ5PmEcIUz2/0nsaGSSS2drkius+JqzZZHxNGQYzY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "grid_map_ros";
  version = "2.2.0-1";
  src = sources.grid_map_ros-d89403d076f057c0b23285d8d5a13d75a823f1e7;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge geometry_msgs grid_map_cmake_helpers grid_map_core grid_map_cv grid_map_msgs nav2_msgs nav_msgs rclcpp rcutils rosbag2_cpp sensor_msgs std_msgs tf2 visualization_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS interface for the grid map library to manage two-dimensional grid maps with multiple data layers.";
  };
}
