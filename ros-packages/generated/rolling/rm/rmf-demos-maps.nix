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
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_maps";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ rmf-building-map-tools ros2run ];
  passthru = {
    sources = mkSourceSet (sources: {
      "rmf_demos_maps" = substituteSource {
        src = fetchgit {
          name = "rmf_demos_maps-source";
          url = "https://github.com/ros2-gbp/rmf_demos-release.git";
          rev = "44a07da1995bebe0c7f85ab3aeb9e51d0297575d";
          hash = "sha256-k6hNNgOSOVtmGt41Ps9lNg8RHEdUn3Qo5yne9ucQPH0=";
        };
      };
    });
  };
  meta = {
    description = "A package containing demo maps for rmf";
  };
})
