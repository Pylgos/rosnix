{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclpy,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  rviz2,
  substituteSource,
  vision-msgs,
  wrapRosQtAppsHook,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "vision_msgs_rviz_plugins";
  version = "4.1.1-2";
  src = finalAttrs.passthru.sources."vision_msgs_rviz_plugins";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz-common rviz-default-plugins rviz-rendering vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vision_msgs_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "e8120da5536fc03f24cae5c068d4c4be1b5cd30d";
        hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
      };
    };
  });
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
})
