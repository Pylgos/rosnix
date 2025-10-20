{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  navmap-ros-interfaces,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-default-plugins,
  rviz-rendering,
  sensor-msgs,
  std-msgs,
  substituteSource,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "navmap_rviz_plugin";
  version = "0.2.3-1";
  src = finalAttrs.passthru.sources."navmap_rviz_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs navmap-ros-interfaces pluginlib rclcpp rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs navmap-ros-interfaces pluginlib rclcpp rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_rviz_plugin" = substituteSource {
      src = fetchgit {
        name = "navmap_rviz_plugin-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "72833843e8611502fe67f0eafd2cbdf204a65add";
        hash = "sha256-gzsXJF4jREmq1g8bkTwYJiT9OkHL+bBwUZYwPOCVYWM=";
      };
    };
  });
  meta = {
    description = "RViz2 display plugin for NavMap surfaces and layers.";
  };
})
