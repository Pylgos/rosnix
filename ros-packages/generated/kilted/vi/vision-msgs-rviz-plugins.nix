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
  version = "4.2.0-1";
  src = finalAttrs.passthru.sources."vision_msgs_rviz_plugins";
  nativeBuildInputs = [ ament-cmake ament-cmake-python wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz-common rviz-default-plugins rviz-rendering vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ pluginlib rclcpp rclpy rviz2 rviz-common rviz-default-plugins rviz-rendering vision-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "vision_msgs_rviz_plugins" = substituteSource {
      src = fetchgit {
        name = "vision_msgs_rviz_plugins-source";
        url = "https://github.com/ros2-gbp/vision_msgs-release.git";
        rev = "34733d8d7a7bcef35be6b13b353f94e70653ebaa";
        hash = "sha256-cgchH4tO1Svc4dxVaxBnIW70pqqV4Y3jzLLdDyEUO5I=";
      };
    };
  });
  meta = {
    description = "RVIZ2 plugins for visualizing vision_msgs";
  };
})
