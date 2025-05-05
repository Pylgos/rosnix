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
  version = "2.3.2-1";
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
        rev = "e5fa4a7684a35ddac0d9a07ceb96c75c3913d151";
        hash = "sha256-ed+6no0zpw6+LZEQ2HlreG7GAy3iNL7jLooqAR6jyLE=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo simulation package for the TurtleBot3\n  ";
  };
})
