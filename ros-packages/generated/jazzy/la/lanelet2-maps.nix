{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_maps";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_maps";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core ];
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_maps" = substituteSource {
      src = fetchgit {
        name = "lanelet2_maps-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "7704cae374e41e84d1549947a4c06afe5d55f061";
        hash = "sha256-neyAYG4BaHOn/2vqAXGTk6mFwmVeutNUc/jdcl7B1HY=";
      };
    };
  });
  meta = {
    description = "Example maps in the lanelet2-format";
  };
})
