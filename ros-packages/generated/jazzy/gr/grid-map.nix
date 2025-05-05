{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-costmap-2d,
  grid-map-cv,
  grid-map-demos,
  grid-map-filters,
  grid-map-loader,
  grid-map-msgs,
  grid-map-octomap,
  grid-map-pcl,
  grid-map-ros,
  grid-map-rviz-plugin,
  grid-map-sdf,
  grid-map-visualization,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-costmap-2d grid-map-cv grid-map-demos grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-pcl grid-map-ros grid-map-rviz-plugin grid-map-sdf grid-map-visualization ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-costmap-2d grid-map-cv grid-map-demos grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-pcl grid-map-ros grid-map-rviz-plugin grid-map-sdf grid-map-visualization ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map" = substituteSource {
      src = fetchgit {
        name = "grid_map-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "c4c8d7d869576b9898ef238db0090aef31061cf8";
        hash = "sha256-r67Aya5Pzcd1ueBK+xvcI3d7zETtg7oOIlh3K79ZUDQ=";
      };
    };
  });
  meta = {
    description = "Meta-package for the universal grid map library.";
  };
})
