{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rmf-building-map-tools,
  ros2run,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rmf_demos_maps";
  version = "2.5.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_maps-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "3fccdd9a85890a068f8b61d3e823b5103dc563de";
        hash = "sha256-56i2UMv5GVPO9oV9GUVBM75RwSd77OgXlz8/b2SjUY0=";
      };
    };
  });
  meta = {
    description = "A package containing demo maps for rmf";
  };
})
