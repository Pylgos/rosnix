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
  pname = "grid_map_octomap";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_octomap";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "liboctomap-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "liboctomap-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_octomap" = substituteSource {
      src = fetchgit {
        name = "grid_map_octomap-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "20fde23bdad753f078f6b78b1f5a53b14bd8a904";
        hash = "sha256-vpJqnOEOjF2Pt70rb0wYDj1WRg1Ozl+DQkRmxQHXpCM=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OctoMap types.";
  };
})
