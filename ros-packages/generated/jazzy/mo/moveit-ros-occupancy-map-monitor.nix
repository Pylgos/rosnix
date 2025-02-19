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
  version = "2.12.2-1";
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
        rev = "e4a7d407235b4190fe38ff6e83b2c53da16e95ee";
        hash = "sha256-OeuO3a1k0NsOKycOZbh+05YMW+gV9GBSK6ZkTNt1oGM=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to occupancy map";
  };
})
