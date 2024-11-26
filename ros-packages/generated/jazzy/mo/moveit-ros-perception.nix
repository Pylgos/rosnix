{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  message-filters,
  mkSourceSet,
  moveit-common,
  moveit-core,
  moveit-msgs,
  moveit-ros-occupancy-map-monitor,
  moveit-ros-planning,
  object-recognition-msgs,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  tf2-ros,
  urdf,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_perception";
  version = "2.10.0-1";
  src = finalAttrs.passthru.sources."moveit_ros_perception";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "moveit_ros_perception" = substituteSource {
        src = fetchgit {
          name = "moveit_ros_perception-source";
          url = "https://github.com/ros2-gbp/moveit2-release.git";
          rev = "5a4fd053525dfaaa338cf73cb2d1956f089d83f4";
          hash = "sha256-NJpX8zqkfP2SGj0YS4mprp/gC9Zwy9jc+md61MDNsSg=";
        };
      };
    });
  };
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
})
