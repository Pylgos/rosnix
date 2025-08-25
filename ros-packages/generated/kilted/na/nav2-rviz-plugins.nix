{
  ament-cmake,
  ament-index-cpp,
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
  nav2-lifecycle-manager,
  nav2-msgs,
  nav2-route,
  nav2-util,
  pluginlib,
  rclcpp,
  rclcpp-action,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  std-msgs,
  substituteSource,
  tf2-geometry-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nav2_rviz_plugins";
  version = "1.4.1-1";
  src = finalAttrs.passthru.sources."nav2_rviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-cpp geometry-msgs nav2-common nav2-lifecycle-manager nav2-msgs nav2-route nav2-util nav-msgs pluginlib rclcpp rclcpp-action rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering std-msgs tf2-geometry-msgs visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-cpp geometry-msgs nav2-common nav2-lifecycle-manager nav2-msgs nav2-route nav2-util nav-msgs pluginlib rclcpp rclcpp-action rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering std-msgs tf2-geometry-msgs visualization-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-opengl" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nav2_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "nav2_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/navigation2-release.git";
        rev = "eb4c5b05c0f7d28bface06799a1ac2dfb6783001";
        hash = "sha256-GOVkRBLdUE5kYBAHodp2R7sx1dNNIN8qDdVWVlvKeYM=";
      };
    };
  });
  meta = {
    description = "Navigation 2 plugins for rviz";
  };
})
