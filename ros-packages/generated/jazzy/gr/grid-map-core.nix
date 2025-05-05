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
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_core";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_core" = substituteSource {
      src = fetchgit {
        name = "grid_map_core-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "5e13872806c4477dcca299a9f0abe847586d0d4a";
        hash = "sha256-MQzhSJtTh5JkExs9POo7hQyfObZpTUqL4ntUqjU3xZw=";
      };
    };
  });
  meta = {
    description = "Universal grid map library to manage two-dimensional grid maps with multiple data layers.";
  };
})
