{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  rviz-common,
  rviz-ogre-vendor,
  rviz-rendering,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_rviz_plugin";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_rviz_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_rviz_plugin" = substituteSource {
      src = fetchgit {
        name = "grid_map_rviz_plugin-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "02f1d99eea7e81af00e87dfbedff31e04508c719";
        hash = "sha256-Uyi6YYp02+vPCx3+9/pkYXyGbpbQTOzCT3COLxVXZ3U=";
      };
    };
  });
  meta = {
    description = "RViz plugin for displaying grid map messages.";
  };
})
