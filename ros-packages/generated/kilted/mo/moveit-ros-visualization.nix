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
  version = "2.13.2-2";
  src = finalAttrs.passthru.sources."moveit_ros_visualization";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ class-loader geometric-shapes interactive-markers moveit-common moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-warehouse object-recognition-msgs pluginlib rclcpp rclpy rviz2 tf2-eigen ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-opengl-dev" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ class-loader geometric-shapes interactive-markers moveit-common moveit-ros-planning-interface moveit-ros-robot-interaction moveit-ros-warehouse object-recognition-msgs pluginlib rclcpp rclpy rviz2 tf2-eigen ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-opengl-dev" "qtbase5-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "moveit_ros_visualization" = substituteSource {
      src = fetchgit {
        name = "moveit_ros_visualization-source";
        url = "https://github.com/ros2-gbp/moveit2-release.git";
        rev = "bfd92ce04780a78af4be25aa4159af7b4745d8e9";
        hash = "sha256-QXXbQTmB1cNrNyO/k5hIeAHFiAfXG7iY6N30f4pHOC8=";
      };
    };
  });
  meta = {
    description = "Components of MoveIt that offer visualization";
  };
})
