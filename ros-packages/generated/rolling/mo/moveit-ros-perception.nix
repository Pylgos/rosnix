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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_perception";
  version = "2.14.1-2";
  src = finalAttrs.passthru.sources."moveit_ros_perception";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_perception" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "8ad90e8a89891e8e7f778b306140c3fd69e18f0e";
        hash = "sha256-f/lTYbwwfp1qHEd2iLyrbwouixAFX8kzn4cUFnoZihI=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
})
