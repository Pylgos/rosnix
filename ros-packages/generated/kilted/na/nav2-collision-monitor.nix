{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav2-common,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-ros,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_collision_monitor";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_collision_monitor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-msgs nav2-util rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-costmap-2d nav2-msgs nav2-util rclcpp rclcpp-components rclcpp-lifecycle sensor-msgs std-msgs tf2 tf2-ros visualization-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_collision_monitor" = substituteSource {
      src = fetchgit {
        name = "nav2_collision_monitor-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "b5d598352b58dfd0dca343ecb00a23a0e307004c";
        hash = "sha256-WPUEZ4COk1wRuAx/k96QLRo99iKv5TMFvCJjQ99w8b4=";
      };
    };
  });
  meta = {
    description = "Collision Monitor";
  };
})
