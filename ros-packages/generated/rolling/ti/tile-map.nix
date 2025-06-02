{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mapviz,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  substituteSource,
  swri-math-util,
  swri-transform-util,
  tf2,
  tf2-ros,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tile_map";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."tile_map";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "qt5-qmake" ]; };
  propagatedNativeBuildInputs = [ mapviz pluginlib rclcpp swri-math-util swri-transform-util tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libglew-dev" "libjsoncpp" "libjsoncpp-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "yaml-cpp" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ mapviz pluginlib rclcpp swri-math-util swri-transform-util tf2 tf2-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglew-dev" "libjsoncpp" "libjsoncpp-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tile_map" = substituteSource {
      src = fetchgit {
        name = "tile_map-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "06d09c2345b72a692207e685ecae1f5bf8e947b0";
        hash = "sha256-qkQnjQsFh42iICXa4yI9ttVrPt0YyF/GGMXAcDNZV4A=";
      };
    };
  });
  meta = {
    description = "\n\n     Tile map provides a slippy map style interface for visualizing \n     OpenStreetMap and GoogleMap tiles.  A mapviz visualization plug-in is also\n     implemented\n\n  ";
  };
})
