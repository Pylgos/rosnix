{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  angles,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  laser-geometry,
  launch,
  launch-testing,
  map-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-lifecycle-manager,
  nav2-map-server,
  nav2-msgs,
  nav2-util,
  nav2-voxel-grid,
  pluginlib,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
  tf2-sensor-msgs,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_costmap_2d";
  version = "1.3.4-1";
  src = finalAttrs.passthru.sources."nav2_costmap_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ angles geometry-msgs laser-geometry map-msgs message-filters nav2-common nav2-msgs nav2-util nav2-voxel-grid nav-msgs pluginlib rclcpp rclcpp-lifecycle sensor-msgs std-msgs std-srvs tf2 tf2-geometry-msgs tf2-ros tf2-sensor-msgs visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common launch launch-testing nav2-lifecycle-manager nav2-map-server ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_costmap_2d" = substituteSource {
      src = fetchgit {
        name = "nav2_costmap_2d-source";
        url = "https://github.com/SteveMacenski/navigation2-release.git";
        rev = "46cc562b9f04c067746ddd463e2b97fb263132a7";
        hash = "sha256-G7HOD6Z/hdpAT1Z/ZQsSIKuvE6M+fFbMA5ITMIEQgBI=";
      };
    };
  });
  meta = {
    description = "This package provides an implementation of a 2D costmap that takes in sensor data from the world, builds a 2D or 3D occupancy grid of the data (depending on whether a voxel based implementation is used), and inflates costs in a 2D costmap based on the occupancy grid and a user specified inflation radius. This package also provides support for map_server based initialization of a costmap, rolling window based costmaps, and parameter based subscription to and configuration of sensor topics.";
  };
})
