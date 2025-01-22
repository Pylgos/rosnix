{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  image-transport,
  map-msgs,
  mapviz,
  marti-common-msgs,
  marti-nav-msgs,
  marti-sensor-msgs,
  marti-visualization-msgs,
  mkSourceSet,
  nav-msgs,
  pluginlib,
  rclcpp,
  rclcpp-action,
  ros-environment,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  stereo-msgs,
  substituteSource,
  swri-image-util,
  swri-math-util,
  swri-route-util,
  swri-transform-util,
  tf2,
  visualization-msgs,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "mapviz_plugins";
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."mapviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ ament-index-cpp cv-bridge gps-msgs image-transport map-msgs mapviz marti-common-msgs marti-nav-msgs marti-sensor-msgs marti-visualization-msgs nav-msgs pluginlib rclcpp rclcpp-action sensor-msgs std-msgs stereo-msgs swri-image-util swri-math-util swri-route-util swri-transform-util tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mapviz_plugins" = substituteSource {
      src = fetchgit {
        name = "mapviz_plugins-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "b554ca7ee5b0e1db75bfefdb6ea1117b1d46c527";
        hash = "sha256-GlHra7f+g7LoN4MBwa0XXz5QQPUiXpJ1xi/M8VlpKQ8=";
      };
    };
  });
  meta = {
    description = "Common plugins for the Mapviz visualization tool";
  };
})
