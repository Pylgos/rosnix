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
  version = "2.4.0-1";
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
        rev = "1c6107246e7f69741ca6e5e2238e6e43f7832f01";
        hash = "sha256-MlaX66h3KbgXskxtnuQMiE/yhDSS8yek89neLhBRVSs=";
      };
    };
  });
  meta = {
    description = "RViz plugin for displaying grid map messages.";
  };
})
