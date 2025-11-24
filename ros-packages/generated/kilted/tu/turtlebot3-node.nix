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
  version = "2.3.4-1";
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
        rev = "0c455af2043f01c4fc58317bf0d34d427b0ded4d";
        hash = "sha256-l6adUe/scm6UCTnnyGaSnCn7nY4wBUv23qUVALEIx9M=";
      };
    };
  });
  meta = {
    description = "\n    TurtleBot3 driver node that include diff drive controller, odometry and tf node\n  ";
  };
})
