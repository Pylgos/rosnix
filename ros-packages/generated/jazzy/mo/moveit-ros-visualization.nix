{
  ament-cmake,
  buildAmentCmakePackage,
  class-loader,
  fetchgit,
  fetchurl,
  fetchzip,
  geometric-shapes,
  interactive-markers,
  mkSourceSet,
  moveit-common,
  moveit-ros-planning-interface,
  moveit-ros-robot-interaction,
  moveit-ros-warehouse,
  object-recognition-msgs,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz2,
  substituteSource,
  tf2-eigen,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "moveit_ros_visualization";
  version = "2.12.1-1";
  src = finalAttrs.passthru.sources."moveit_ros_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ class-loader geometric-shapes interactive-markers moveit-common moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-warehouse object-recognition-msgs pluginlib rclcpp rclpy rviz2 tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-opengl-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_visualization" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_visualization-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "98c440d6098e0cae392eb061b60d763ebb143204";
        hash = "sha256-3hwzyqNxstS1Fc/hTB+R4YkD4023z/7t1Vs3nqi2Q5k=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer visualization";
  };
})
