{
  ament-cmake,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  laser-geometry,
  map-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-voxel-grid,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nonpersistent_voxel_layer";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."nonpersistent_voxel_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs laser-geometry map-msgs nav2-costmap-2d nav2-msgs nav2-voxel-grid nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nonpersistent_voxel_layer" = substituteSource {
      src = fetchgit {
        name = "nonpersistent_voxel_layer-source";
        url = "https://github.com/SteveMacenski/nonpersistent_voxel_layer-release.git";
        rev = "d4e4c00aac84a75444d065aca94129af612f5e97";
        hash = "sha256-w2Dz5UJT3Ivc12VlPpuaInFTw+AhRUZ+Hu5nzLdEFzM=";
      };
    };
  });
  meta = {
    description = "include This package provides an implementation of a 3D costmap that takes in sensor data from the world, builds a 3D occupancy grid of the data for only one iteration.";
  };
})
