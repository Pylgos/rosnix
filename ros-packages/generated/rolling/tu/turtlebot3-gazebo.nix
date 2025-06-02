{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  ros-gz-bridge,
  ros-gz-image,
  ros-gz-sim,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_gazebo";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclcpp ros-gz-bridge ros-gz-image ros-gz-sim sensor-msgs tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp ros-gz-bridge ros-gz-image ros-gz-sim sensor-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "9fe78981f4e461941558b045d1b6d0fea6371789";
        hash = "sha256-ZjnG3xgUm3MraH1xAAQnAZEVURe1VLNNhXFoM8dJzbc=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo simulation package for the TurtleBot3\n  ";
  };
})
