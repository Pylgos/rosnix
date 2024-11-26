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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_costmap_2d";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs grid-map-cmake-helpers grid-map-core nav2-costmap-2d tf2-geometry-msgs tf2-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_costmap_2d" = substituteSource {
        src = fetchgit {
          name = "grid_map_costmap_2d-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "65bc27b037f4843e56e43c3e2ef87584e9e73bf2";
          hash = "sha256-n5HVmkLwsGs+vxqRbH+3eiHTsA3bmGXgKQOu+mP04i4=";
        };
      };
    });
  };
  meta = {
    description = "Interface for grid maps to the costmap_2d format.";
  };
})
