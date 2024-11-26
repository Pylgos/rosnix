{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "geometry_tutorials";
  version = "0.6.2-1";
  src = finalAttrs.passthru.sources."geometry_tutorials";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "geometry_tutorials" = substituteSource {
      src = fetchgit {
        name = "geometry_tutorials-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "e5a64a1b195d49794093248bdf3f7bdb8d64e50c";
        hash = "sha256-pKGL96jK4+eJOdLsryPMZOhHrsfCeS5TARr8qQeRhPI=";
      };
    };
  });
  meta = {
    description = "Metapackage of geometry tutorials ROS.";
  };
})
