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
  nav-msgs,
  nav2-common,
  nav2-core,
  nav2-costmap-2d,
  nav2-util,
  pluginlib,
  rcl-interfaces,
  rclcpp,
  rclcpp-lifecycle,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_theta_star_planner";
  version = "1.4.2-1";
  src = finalAttrs.passthru.sources."nav2_theta_star_planner";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs nav2-common nav2-core nav2-costmap-2d nav2-util nav-msgs pluginlib rcl-interfaces rclcpp rclcpp-lifecycle tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_theta_star_planner" = substituteSource {
      src = fetchgit {
        name = "nav2_theta_star_planner-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "598bebba980dd05ab43ba34e5bcbd6bc0b979af2";
        hash = "sha256-AuP9tynUa4dAfhkJP2GarPyb2F5FsapQT0/FKBjsgqc=";
      };
    };
  });
  meta = {
    description = "Theta* Global Planning Plugin";
  };
})
