{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  grid-map-cmake-helpers,
  grid-map-core,
  mkSourceSet,
  nav2-costmap-2d,
  rosSystemPackages,
  substituteSource,
  tf2-geometry-msgs,
  tf2-ros,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_costmap_2d";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_costmap_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ geometry-msgs grid-map-cmake-helpers grid-map-core nav2-costmap-2d tf2-geometry-msgs tf2-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers grid-map-core nav2-costmap-2d tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_costmap_2d" = substituteSource {
      src = fetchgit {
        name = "grid_map_costmap_2d-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "b916852482369065e3cfe37f6cae16b95e7de90f";
        hash = "sha256-A1oOfhc28Gziq8Wb8hcyUDwcy6atUY3bmdWd+yir9v4=";
      };
    };
  });
  meta = {
    description = "Interface for grid maps to the costmap_2d format.";
  };
})
