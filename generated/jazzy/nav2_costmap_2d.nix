{
  ament_cmake,
  ament_cmake_gtest,
  ament_lint_auto,
  ament_lint_common,
  angles,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  laser_geometry,
  launch,
  launch_testing,
  map_msgs,
  message_filters,
  nav2_common,
  nav2_lifecycle_manager,
  nav2_map_server,
  nav2_msgs,
  nav2_util,
  nav2_voxel_grid,
  nav_msgs,
  pluginlib,
  rclcpp,
  rclcpp_lifecycle,
  sensor_msgs,
  std_msgs,
  std_srvs,
  substituteSource,
  tf2,
  tf2_geometry_msgs,
  tf2_ros,
  tf2_sensor_msgs,
  visualization_msgs,
}:
let
  sources = rec {
    nav2_costmap_2d = substituteSource {
      src = fetchgit {
        name = "nav2_costmap_2d-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "b83cd7d17af1a2d0ca1e7f57fb3f5c56f06eec55";
        hash = "sha256-JorqUFfLMk72HunH0GA2akURRw6BDCXHICrzwbf9gj0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "nav2_costmap_2d";
  version = "1.3.2-1";
  src = sources.nav2_costmap_2d;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ angles geometry_msgs laser_geometry map_msgs message_filters nav2_common nav2_msgs nav2_util nav2_voxel_grid nav_msgs pluginlib rclcpp rclcpp_lifecycle sensor_msgs std_msgs std_srvs tf2 tf2_geometry_msgs tf2_ros tf2_sensor_msgs visualization_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_cmake_gtest ament_lint_auto ament_lint_common launch launch_testing nav2_lifecycle_manager nav2_map_server ];
  missingDependencies = [  ];
  meta = {
    description = "This package provides an implementation of a 2D costmap that takes in sensor data from the world, builds a 2D or 3D occupancy grid of the data (depending on whether a voxel based implementation is used), and inflates costs in a 2D costmap based on the occupancy grid and a user specified inflation radius. This package also provides support for map_server based initialization of a costmap, rolling window based costmaps, and parameter based subscription to and configuration of sensor topics.";
  };
}
