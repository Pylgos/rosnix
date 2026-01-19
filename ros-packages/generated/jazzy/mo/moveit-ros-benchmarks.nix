{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-param-builder,
  mkSourceSet,
  moveit-common,
  moveit-configs-utils,
  moveit-core,
  moveit-ros-planning,
  moveit-ros-warehouse,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_benchmarks";
  version = "2.12.4-1";
  src = finalAttrs.passthru.sources."moveit_ros_benchmarks";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-ros-planning moveit-ros-warehouse pluginlib rclcpp tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-ros-planning moveit-ros-warehouse pluginlib rclcpp tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_benchmarks" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_benchmarks-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "065ccb069a02b26122eb5f6cebcca2c103cbef8c";
        hash = "sha256-h06TC1FMTFq6SiW8WGftVZ1RphITExJ8ocNBI6p3aok=";
      };
    };
  });
  meta = {
    description = "Enhanced tools for benchmarks in MoveIt";
  };
})
