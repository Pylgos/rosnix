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
  version = "4.1.1-3";
  src = finalAttrs.passthru.sources."vision_msgs_rviz_plugins";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz-common rviz-default-plugins rviz-rendering vision-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "vision_msgs_rviz_plugins" = substituteSource {
        src = fetchgit {
          name = "vision_msgs_rviz_plugins-source";
          url = "https://github.com/ros2-gbp/vision_msgs-release.git";
          rev = "ebb9be37660ba670afd284336523d0de9dd2d0ee";
          hash = "sha256-If7mQ5EP7ZLB2EDPnUwciKX0dBfJa4PjuLnUH/ThGjM=";
        };
      };
    });
  };
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
})
