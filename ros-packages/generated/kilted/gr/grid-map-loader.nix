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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."grid_map_loader";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "grid_map_loader" = substituteSource {
      src = fetchgit {
        name = "grid_map_loader-source";
        url = "https://github.com/ros2-gbp/grid_map-release.git";
        rev = "715a491c446d16bcbdb4fc320086655809508f0b";
        hash = "sha256-pHP+4x8+xK+Mk+AynMMXyhGr79xNyp99s9Zm6atNKlM=";
      };
    };
  });
  meta = {
    description = "Loading and publishing grid maps from bag files.";
  };
})
