{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  navmap-core,
  navmap-ros,
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
  version = "0.4.0-1";
  src = finalAttrs.passthru.sources."navmap_rviz_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib rclcpp rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs navmap-core navmap-ros navmap-ros-interfaces pluginlib rclcpp rviz-common rviz-default-plugins rviz-rendering sensor-msgs std-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "navmap_rviz_plugin" = substituteSource {
      src = fetchgit {
        name = "navmap_rviz_plugin-source";
        url = "https://github.com/EasyNavigation/NavMap-release.git";
        rev = "d8fd4b2bae8cb502e8d8ab6aef8a29e19c257d26";
        hash = "sha256-pMg3e9cLalyOH6QfS8/CAU9/AiOkiuOQY6P7Kzwgr9Q=";
      };
    };
  });
  meta = {
    description = "RViz2 display plugin for NavMap surfaces and layers.";
  };
})
