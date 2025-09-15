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
  version = "2.4.0-1";
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
        rev = "ec5658b3868c56e6aafe257f2cc6ebc063c0f7de";
        hash = "sha256-iupBz0+PTqyKlILZhoXdfYBYsmrFD8H8EYE/Xp5nOus=";
      };
    };
  });
  meta = {
    description = "Meta-package for the universal grid map library.";
  };
})
