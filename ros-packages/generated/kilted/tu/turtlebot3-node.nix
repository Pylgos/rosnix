{
  ament-cmake,
  buildAmentCmakePackage,
  dynamixel-sdk,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  message-filters,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  tf2,
  tf2-ros,
  turtlebot3-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_node";
  version = "2.3.6-1";
  src = finalAttrs.passthru.sources."turtlebot3_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ dynamixel-sdk geometry-msgs message-filters nav-msgs rclcpp rcutils sensor-msgs std-msgs std-srvs tf2 tf2-ros turtlebot3-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk geometry-msgs message-filters nav-msgs rclcpp rcutils sensor-msgs std-msgs std-srvs tf2 tf2-ros turtlebot3-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_node-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "3b552caffaf4078f741f18164ca230a4223eaa7c";
        hash = "sha256-34lr3TH+0sT1iKvO4N26mFNpHcV2q91MErHo6a3Urm4=";
      };
    };
  });
  meta = {
    description = "\n    TurtleBot3 driver node that include diff drive controller, odometry and tf node\n  ";
  };
})
