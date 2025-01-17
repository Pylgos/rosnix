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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_rviz_plugin";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros rclcpp rviz-common rviz-ogre-vendor rviz-rendering ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libqt5-core" "libqt5-gui" "libqt5-widgets" "qtbase5-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_rviz_plugin" = substituteSource {
      src = fetchgit {
        name = "grid_map_rviz_plugin-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b347fa11e021fd9fc2e74c93f3e58ef9080afc72";
        hash = "sha256-DAioUw7W4LJs4Pt/ZYANnFiCDBerU3Rbnk7Ql3LEq7w=";
      };
    };
  });
  meta = {
    description = "RViz plugin for displaying grid map messages.";
  };
})
