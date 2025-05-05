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
  version = "2.2.1-1";
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
        rev = "ff472659e39598451123fe9a640014f6c163c820";
        hash = "sha256-7WzrwvjlNYqgBRsKK+8RbobCiylBRhkLjzJOl0HHjrQ=";
      };
    };
  });
  meta = {
    description = "Generates signed distance fields from grid maps.";
  };
})
