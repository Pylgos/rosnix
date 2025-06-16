{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  gz-math-vendor,
  gz-plugin-vendor,
  gz-sim-vendor,
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
  version = "2.3.5-1";
  src = finalAttrs.passthru.sources."turtlebot3_gazebo";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs gz-math-vendor gz-plugin-vendor gz-sim-vendor nav-msgs rclcpp ros-gz-bridge ros-gz-image ros-gz-sim sensor-msgs tf2 ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs gz-math-vendor gz-plugin-vendor gz-sim-vendor nav-msgs rclcpp ros-gz-bridge ros-gz-image ros-gz-sim sensor-msgs tf2 ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_gazebo" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_gazebo-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "c73eb537af5274fdcb846cfd613f93eacaaa33dd";
        hash = "sha256-n4gDCqRoQgcUs7Y6miUM7ZUcOSXduaHnjWpREzIw+L0=";
      };
    };
  });
  meta = {
    description = "\n    Gazebo simulation package for the TurtleBot3\n  ";
  };
})
