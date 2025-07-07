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
  version = "2.14.0-1";
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
        rev = "46db147b89e99ca51e40230383cbc5b65300c9fa";
        hash = "sha256-DB46TgdYBfz7LLON4Qqwk4VJCCTJC3fwqac/8HUpkJc=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
