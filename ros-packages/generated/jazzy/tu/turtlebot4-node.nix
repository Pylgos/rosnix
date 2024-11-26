{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  irobot-create-msgs,
  mkSourceSet,
  rclcpp,
  rclcpp-action,
  rcutils,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  std-srvs,
  substituteSource,
  turtlebot4-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_node";
  version = "2.0.1-1";
  src = finalAttrs.passthru.sources."turtlebot4_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs std-srvs turtlebot4-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot4_node" = substituteSource {
        src = fetchgit {
          name = "turtlebot4_node-source";
          url = "https://github.com/ros2-gbp/turtlebot4-release.git";
          rev = "0be5e29b81e3aa797dfc9f7631336960ed2a66ab";
          hash = "sha256-GrJ7FKrgpc0hJWDIvcvyIKAR9f1LaCkTIpqzA2IncgM=";
        };
      };
    });
  };
  meta = {
    description = "Turtlebot4 Node";
  };
})
