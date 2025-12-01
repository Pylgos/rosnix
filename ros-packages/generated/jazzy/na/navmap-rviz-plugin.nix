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
  version = "0.3.0-1";
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
        rev = "b4754ce1416cb8318d9eae60f5937bd169979173";
        hash = "sha256-dfWnXm2mvaVPbN8ETQf/Brgr3ANzi5V4FWJkABrR+k4=";
      };
    };
  });
  meta = {
    description = "RViz2 display plugin for NavMap surfaces and layers.";
  };
})
