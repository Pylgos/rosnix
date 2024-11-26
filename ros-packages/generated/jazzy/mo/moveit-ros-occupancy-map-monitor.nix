{
  ament-cmake,
  ament-cmake-gmock,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric-shapes,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_occupancy_map_monitor";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_occupancy_map_monitor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ geometric-shapes moveit-common moveit-core moveit-msgs pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gmock ];
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros_occupancy_map_monitor" = substituteSource {
        src = fetchgit {
          name = "moveit_ros_occupancy_map_monitor-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "6ab5e07eb5f5945162f845d32c84b7c8ce827ab4";
          hash = "sha256-WHbMOwEkQoPOrHQOeH/0GJyEa7g/ez3LJsJTZw6jUUw=";
        };
      };
    });
  };
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
