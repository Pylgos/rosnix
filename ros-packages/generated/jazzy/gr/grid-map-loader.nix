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
  grid-map-msgs,
  grid-map-ros,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_loader";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_loader";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_loader" = substituteSource {
      src = fetchgit {
        name = "grid_map_loader-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "145f2b7800caee1ed542fa74ddbd0e104b29d46e";
        hash = "sha256-haWLLnlpI4rzlV7GEJa4gSyer/Y3LE6bn7t1vdvG7S4=";
      };
    };
  });
  meta = {
    description = "Loading and publishing grid maps from bag files.";
  };
})
