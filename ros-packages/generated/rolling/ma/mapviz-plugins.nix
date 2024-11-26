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
  version = "2.4.3-1";
  src = finalAttrs.passthru.sources."mapviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ ament-index-cpp cv-bridge gps-msgs image-transport map-msgs mapviz marti-common-msgs marti-nav-msgs marti-sensor-msgs marti-visualization-msgs nav-msgs pluginlib rclcpp rclcpp-action sensor-msgs std-msgs stereo-msgs swri-image-util swri-math-util swri-route-util swri-transform-util tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "mapviz_plugins" = substituteSource {
        src = fetchgit {
          name = "mapviz_plugins-source";
          url = "https://github.com/ros2-gbp/mapviz-release.git";
          rev = "6752c94367d4b6b9be05f5029f8e2f0ba4a763e6";
          hash = "sha256-NSStccAh0YxU7PjWnggfTIoejGS9SpbMcDMmryOXaa0=";
        };
      };
    });
  };
  meta = {
    description = "Common plugins for the Mapviz visualization tool";
  };
})
