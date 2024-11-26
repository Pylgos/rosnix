{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  grid-map-cmake-helpers,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_core";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_core" = substituteSource {
        src = fetchgit {
          name = "grid_map_core-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "62a7d5dbc8dac1525797c562015107125df608b5";
          hash = "sha256-9aVbWWdPmtYwrYhuIxr84Ft0dddBBrOP3ZUbBrz4TXE=";
        };
      };
    });
  };
  meta = {
    description = "Universal grid map library to manage two-dimensional grid maps with multiple data layers.";
  };
})
