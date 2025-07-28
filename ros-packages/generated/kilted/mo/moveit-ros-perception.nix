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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_ros_perception";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge image-transport message-filters moveit-common moveit-core moveit-msgs moveit-ros-occupancy-map-monitor moveit-ros-planning object-recognition-msgs pluginlib rclcpp sensor-msgs tf2 tf2-eigen tf2-geometry-msgs tf2-ros urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "glut" "libglew-dev" "libomp-dev" "opengl" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_perception" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_perception-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "cfa7395b530260c174725281873aeb91ad938682";
        hash = "sha256-BFbhejnHKNVFK5BbMAfaCAqAHd4TojWbH95MD1QFDU0=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt connecting to perception";
  };
})
