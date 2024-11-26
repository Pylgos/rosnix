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
  version = "2.2.0-1";
  src = finalAttrs.passthru.sources."grid_map_octomap";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ grid-map-cmake-helpers grid-map-core octomap ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "grid_map_octomap" = substituteSource {
        src = fetchgit {
          name = "grid_map_octomap-source";
          url = "https://github.com/ros2-gbp/grid_map-release.git";
          rev = "5ade9fc283da6134d112a0bddee5344a7b707aeb";
          hash = "sha256-XOSuh3xDRe5V70xnIa3O6/ix3PDcno0efxX9BAxWWFs=";
        };
      };
    });
  };
  meta = {
    description = "Conversions between grid maps and OctoMap types.";
  };
})
