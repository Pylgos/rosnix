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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_sdf";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libpcl-all-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libpcl-all-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_sdf" = substituteSource {
      src = fetchgit {
        name = "grid_map_sdf-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "96b23012e01ef7823275461b15d19a91d865018d";
        hash = "sha256-Hv5AITAb3tYEsZGSHF4NRUIbofDqQxrOjc4FXjAfZqU=";
      };
    };
  });
  meta = {
    description = "Generates signed distance fields from grid maps.";
  };
})
