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
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tile_map";
  version = "2.4.5-1";
  src = finalAttrs.passthru.sources."tile_map";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  buildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "qt5-qmake" ]; };
  propagatedBuildInputs = [ mapviz pluginlib rclcpp swri-math-util swri-transform-util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libglew-dev" "libjsoncpp" "libjsoncpp-dev" "libqt5-core" "libqt5-opengl" "libqt5-opengl-dev" "yaml-cpp" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tile_map" = substituteSource {
      src = fetchgit {
        name = "tile_map-source";
        url = "https://github.com/ros2-gbp/mapviz-release.git";
        rev = "34d4de4a89622df241bb59b7a43d997f135f659f";
        hash = "sha256-SsHgObDFX8nfRURxp+wdys6+44IoMttT69AV/j3R/8M=";
      };
    };
  });
  meta = {
    description = "Tile map provides a slippy map style interface for visualizing OpenStreetMap and GoogleMap tiles. A mapviz visualization plug-in is also implemented";
  };
})
