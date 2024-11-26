{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  filters,
  grid-map-cmake-helpers,
  grid-map-core,
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  pluginlib,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_filters";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_filters" = substituteSource {
        src = fetchgit {
          name = "grid_map_filters-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "f94980e5405c1ba21c7187f3b17629d6c9b0a04a";
          hash = "sha256-ckMZDVEk435pl5NW+PLvvGC0A38wDWfItz09kpEoftQ=";
        };
      };
    });
  };
  meta = {
    description = "Processing grid maps as a sequence of ROS filters.";
  };
})
