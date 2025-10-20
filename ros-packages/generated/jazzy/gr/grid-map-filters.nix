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
  version = "2.2.2-2";
  src = finalAttrs.passthru.sources."grid_map_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tbb" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_filters" = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "480819c025e859881ac27b67ffbc3a5ffb340751";
        hash = "sha256-7jGHEtg71ZJ1D8T48ClQoBvF+WLfIO3vDNSCnyzkglg=";
      };
    };
  });
  meta = {
    description = "Processing grid maps as a sequence of ROS filters.";
  };
})
