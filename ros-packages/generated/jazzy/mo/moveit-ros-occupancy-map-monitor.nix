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
  version = "2.12.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_occupancy_map_monitor";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module ];
  propagatedBuildInputs = [ geometric-shapes moveit-common moveit-core moveit-msgs pluginlib rclcpp tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "liboctomap-dev" ]; };
  checkInputs = [ ament-cmake-gmock ];
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_occupancy_map_monitor" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_occupancy_map_monitor-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "37606dc1a194eb7b7d63747304e7ff6e707f7f71";
        hash = "sha256-6mmGc8vl5XyVr/iflOVJOaz5FjqOPx1bkbxGg0T4gFg=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
