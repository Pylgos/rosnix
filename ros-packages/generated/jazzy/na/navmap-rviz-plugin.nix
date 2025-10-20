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
  version = "0.2.5-1";
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
        rev = "12aee380433833c233de84d9f72c0623192f3158";
        hash = "sha256-w/xWrK9FLxYgVwr5WOGn6TAKGeRNKDIbrfxc6y2RNm0=";
      };
    };
  });
  meta = {
    description = "RViz2 display plugin for NavMap surfaces and layers.";
  };
})
