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
  grid-map-core,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_sdf";
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_sdf";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_sdf" = substituteSource {
        src = fetchgit {
          name = "grid_map_sdf-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "e0edb03fc06d1afe46a6f68f735c12b588073966";
          hash = "sha256-xaVPI1GG4agH0Va8y03KPbPJFZ9qVyoOjT4F+ukjWWk=";
        };
      };
    });
  };
  meta = {
    description = "Generates signed distance fields from grid maps.";
  };
})
