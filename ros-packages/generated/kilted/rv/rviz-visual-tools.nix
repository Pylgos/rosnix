{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  eigen-stl-containers,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  interactive-markers,
  launch,
  launch-ros,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-ogre-vendor,
  rviz-rendering,
  rviz2,
  sensor-msgs,
  shape-msgs,
  std-msgs,
  substituteSource,
  tf2,
  tf2-eigen,
  tf2-geometry-msgs,
  trajectory-msgs,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rviz_visual_tools";
  version = "4.1.4-4";
  src = finalAttrs.passthru.sources."rviz_visual_tools";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ament-index-python eigen3-cmake-module eigen-stl-containers geometry-msgs interactive-markers launch launch-ros pluginlib rclcpp rclcpp-components rviz2 rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs shape-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python eigen3-cmake-module eigen-stl-containers geometry-msgs interactive-markers launch launch-ros pluginlib rclcpp rclcpp-components rviz2 rviz-common rviz-default-plugins rviz-ogre-vendor rviz-rendering sensor-msgs shape-msgs std-msgs tf2 tf2-eigen tf2-geometry-msgs trajectory-msgs visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rviz_visual_tools" = substituteSource {
      src = fetchgit {
        name = "rviz_visual_tools-source";
        url = "https://github.com/ros2-gbp/rviz_visual_tools-release.git";
        rev = "342fa0f180af66b0de28084fec2d1d7f06824c21";
        hash = "sha256-tVfPKQNpM962nm3D4nPbalanEed98pZ6A4v4ySC79yI=";
      };
    };
  });
  meta = {
    description = "Utility functions for displaying and debugging data in Rviz via published markers";
  };
})
