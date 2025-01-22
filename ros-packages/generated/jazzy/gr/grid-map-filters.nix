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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_filters";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ filters grid-map-cmake-helpers grid-map-core grid-map-msgs grid-map-ros pluginlib ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tbb" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_filters" = substituteSource {
      src = fetchgit {
        name = "grid_map_filters-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "6055e5515a3cd66c19fc539a23a0831de8982933";
        hash = "sha256-tN3e42Bi5YNoTnTQ+tCQhigCHZfrC3eP20r0fVZ3uQ0=";
      };
    };
  });
  meta = {
    description = "Processing grid maps as a sequence of ROS filters.";
  };
})
