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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_loader";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-msgs grid-map-ros ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_loader" = substituteSource {
        src = fetchgit {
          name = "grid_map_loader-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "4501f5bc538250bd4dc4b016ba952b05b243039f";
          hash = "sha256-Qd1RNyDd206Vr7IV8iIlm6BUxM+U3emoWQlVg2YEPBg=";
        };
      };
    });
  };
  meta = {
    description = "Loading and publishing grid maps from bag files.";
  };
})
