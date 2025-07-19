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
  version = "2.6.0-1";
  src = finalAttrs.passthru.sources."nonpersistent_voxel_layer";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs laser-geometry map-msgs nav2-costmap-2d nav2-msgs nav2-voxel-grid nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs laser-geometry map-msgs nav2-costmap-2d nav2-msgs nav2-voxel-grid nav-msgs pluginlib rclcpp sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "nonpersistent_voxel_layer" = substituteSource {
      src = fetchgit {
        name = "nonpersistent_voxel_layer-source";
        url = "https://github.com/SteveMacenski/nonpersistent_voxel_layer-release.git";
        rev = "a71c2887ad376a5b50d1b2248852c59d6891e9ee";
        hash = "sha256-AtjpDZMx7TxFRhcYeXd7pjPRAOfqTAiwo06acRop9fw=";
      };
    };
  });
  meta = {
    description = "include\n        This package provides an implementation of a 3D costmap that takes in sensor\n        data from the world, builds a 3D occupancy grid of the data for only one iteration.\n    ";
  };
})
