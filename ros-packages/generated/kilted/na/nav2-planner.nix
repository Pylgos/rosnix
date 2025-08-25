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
  lifecycle-msgs,
  mkSourceSet,
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-msgs,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_planner";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs lifecycle-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle tf2 tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs lifecycle-msgs nav2-common nav2-core nav2-costmap-2d nav2-msgs nav2-util nav-msgs pluginlib rclcpp rclcpp-components rclcpp-lifecycle tf2 tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_planner-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "8528fccc225c42d97da1e0c033db40cfe344ad9e";
        hash = "sha256-8fL+wfOMuHE9420AmmE+0YG6jbyMZAmb+g40ChyS7io=";
      };
    };
  });
  meta = {
    description = "Nav2 planner server package";
  };
})
