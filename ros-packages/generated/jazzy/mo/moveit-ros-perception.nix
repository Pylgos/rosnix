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
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_perception";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_perception" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "ee3aa056bfc8078b650a6d946ab18a37c0d25ff5";
        hash = "sha256-g7k+PtP2W0eXxIwywvv4N5xHKNrjp0dfYDwUN8aEmV8=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
})
