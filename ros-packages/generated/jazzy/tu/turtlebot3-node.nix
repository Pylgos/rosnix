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
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ dynamixel-sdk geometry-msgs message-filters nav-msgs rclcpp rcutils sensor-msgs std-msgs std-srvs tf2 tf2-ros turtlebot3-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_node-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "ec3b08cd351c47eaf0a98980131a23a2b6aacdb3";
        hash = "sha256-bn4vbGBJu9+n8k5/J6k40KMe0KQAB5zNXcs2X/y4nXA=";
      };
    };
  });
  meta = {
    description = "TurtleBot3 driver node that include diff drive controller, odometry and tf node";
  };
})
