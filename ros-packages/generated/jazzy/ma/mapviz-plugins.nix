{
  ament-cmake,
  ament-index-cpp,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
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
  std-srvs,
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
  version = "2.5.5-1";
  src = finalAttrs.passthru.sources."mapviz_plugins";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt5-qmake" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp cv-bridge geometry-msgs gps-msgs image-transport map-msgs mapviz marti-common-msgs marti-nav-msgs marti-sensor-msgs marti-visualization-msgs nav-msgs pluginlib rclcpp rclcpp-action ros-environment sensor-msgs std-msgs std-srvs stereo-msgs swri-image-util swri-math-util swri-route-util swri-transform-util tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ ament-index-cpp cv-bridge geometry-msgs gps-msgs image-transport map-msgs mapviz marti-common-msgs marti-nav-msgs marti-sensor-msgs marti-visualization-msgs nav-msgs pluginlib rclcpp rclcpp-action ros-environment sensor-msgs std-msgs std-srvs stereo-msgs swri-image-util swri-math-util swri-route-util swri-transform-util tf2 visualization-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" ]; };
  passthru.sources = mkSourceSet (sources: {
    "mapviz_plugins" = substituteSource {
      src = fetchgit {
        name = "mapviz_plugins-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "43b15dff46c915ede3927efe1d9aa5e781fb90d0";
        hash = "sha256-M/OW4fAxzAktrQFGcn/XKSkOvYsaynk0A37qaDynH+k=";
      };
    };
  });
  meta = {
    description = "\n\n    Common plugins for the Mapviz visualization tool\n\n  ";
  };
})
