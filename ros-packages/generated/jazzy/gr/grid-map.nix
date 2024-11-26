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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core grid-map-costmap-2d grid-map-cv grid-map-demos grid-map-filters grid-map-loader grid-map-msgs grid-map-octomap grid-map-pcl grid-map-ros grid-map-rviz-plugin grid-map-sdf grid-map-visualization ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map" = substituteSource {
      src = fetchgit {
        name = "grid_map-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "19690009ed1768c25a09a4c60d40a8ded52f3878";
        hash = "sha256-UDD+yaCrVCJ7CRgcWz9eNZ7foYmtVwX4JxVlJlrE1A0=";
      };
    };
  });
  meta = {
    description = "Meta-package for the universal grid map library.";
  };
})
