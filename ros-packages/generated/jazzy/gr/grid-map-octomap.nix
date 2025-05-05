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
  octomap,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "grid_map_octomap";
  version = "2.2.1-1";
  src = finalAttrs.passthru.sources."grid_map_octomap";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-core octomap ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core octomap ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_octomap" = substituteSource {
      src = fetchgit {
        name = "grid_map_octomap-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "e418cf2566bf803d7cc2fd6a775bc28e2f9c58b6";
        hash = "sha256-CqHI6uBAp7MEYqaD9cPIfDAreYsSleAWuF0AjZyROCI=";
      };
    };
  });
  meta = {
    description = "Conversions between grid maps and OctoMap types.";
  };
})
