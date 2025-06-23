{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-msgs,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  tf2,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_follower";
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_follower";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-msgs rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-msgs rclcpp std-msgs tf2 tf2-geometry-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_follower" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_follower-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "52d783197bf27596f3a6da7bc5dd95229577d380";
        hash = "sha256-H7qXSQAXdMVenmDnR0bSIXjPcE4iMSkC9C6mWRi/IWU=";
      };
    };
  });
  meta = {
    description = "\n    TurtleBot3 Follower Example for ROS2.\n  ";
  };
})
