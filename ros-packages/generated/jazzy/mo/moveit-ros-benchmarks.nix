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
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_benchmarks";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ launch-param-builder moveit-common moveit-configs-utils moveit-core moveit-ros-planning moveit-ros-warehouse pluginlib rclcpp tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-date-time" "libboost-date-time-dev" "libboost-dev" "libboost-filesystem" "libboost-filesystem-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros_benchmarks" = substituteSource {
        src = fetchgit {
          name = "moveit_ros_benchmarks-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "93bf8852d4435dfccab9055a267af6c5111f9934";
          hash = "sha256-sHVNAk/cZy7UtZldddJLN7kWaaakA6FCskuG1egghKU=";
        };
      };
    });
  };
  meta = {
    description = "Enhanced tools for benchmarks in MoveIt";
  };
})
