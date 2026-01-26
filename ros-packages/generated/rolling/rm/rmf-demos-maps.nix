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
  version = "2.8.1-2";
  src = finalAttrs.passthru.sources."rmf_demos_maps";
  nativeBuildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  buildInputs = [ ament-cmake rmf-building-map-tools ros2run ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_maps" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_maps-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "249d115a3833c9240df16b15aa602332f20d00fe";
        hash = "sha256-VhASHMRVpco9nXRhwXMJfA8ekbpCFnUk9xDbHVavx6I=";
      };
    };
  });
  meta = {
    description = "A package containing demo maps for rmf";
  };
})
