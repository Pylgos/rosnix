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
  robot-state-publisher,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2,
  tf2-msgs,
  turtlebot3-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_fake_node";
  version = "2.2.5-5";
  src = finalAttrs.passthru.sources."turtlebot3_fake_node";
  propagatedNativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclcpp robot-state-publisher sensor-msgs tf2 tf2-msgs turtlebot3-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_fake_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_fake_node-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "d51d854fb17df3f0dc2ab07fb0a086f8166bca5e";
        hash = "sha256-RC56Xh4EBNwDvXTRDOIw1kV2Q9fZB4veFuXoOZI3KZA=";
      };
    };
  });
  meta = {
    description = "Package for TurtleBot3 fake node. With this package, simple tests can be done without a robot. You can do simple tests using this package on rviz without real robots.";
  };
})
