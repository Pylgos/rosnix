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
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_maps";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core ];
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_maps" = substituteSource {
      src = fetchgit {
        name = "lanelet2_maps-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "db6403e91180c4a93b2ce17ee7bb21667fbda6ad";
        hash = "sha256-neyAYG4BaHOn/2vqAXGTk6mFwmVeutNUc/jdcl7B1HY=";
      };
    };
  });
  meta = {
    description = "Example maps in the lanelet2-format";
  };
})
