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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."turtlebot4_node";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs std-srvs turtlebot4-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ irobot-create-msgs rclcpp rclcpp-action rcutils sensor-msgs std-msgs std-srvs turtlebot4-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_node" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_node-source";
        url = "https://github.com/ros2-gbp/turtlebot4-release.git";
        rev = "17b311b449c1f3df2ff81347a69ad0c2b3edf95d";
        hash = "sha256-nC++1wRYDf2f64s9MhFMjijp4tBTChvzoTMsVOMJXuI=";
      };
    };
  });
  meta = {
    description = "Turtlebot4 Node";
  };
})
