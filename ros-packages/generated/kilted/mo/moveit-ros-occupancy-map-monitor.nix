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
  version = "2.14.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_occupancy_map_monitor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module geometric-shapes moveit-common moveit-core moveit-msgs pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "liboctomap-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module geometric-shapes moveit-common moveit-core moveit-msgs pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liboctomap-dev" ]; };
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_occupancy_map_monitor" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_occupancy_map_monitor-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "30503382970fa59e1cae53f5cd06ad3e5d3ad17f";
        hash = "sha256-yfpENJ8PrqO+kvGx6633nQLzCjD8LijnTi7Z7pWUkyY=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
