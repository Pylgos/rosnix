{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-io,
  lanelet2-maps,
  lanelet2-projection,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_matching";
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_matching";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-traffic-rules mrt-cmake-modules ];
  checkInputs = [ lanelet2-io lanelet2-maps lanelet2-projection ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_matching" = substituteSource {
      src = fetchgit {
        name = "lanelet2_matching-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "1f596aee68f20a115a33c6d5d64dbd681c814121";
        hash = "sha256-umrqsdgMBtb04ryHzY6h/Yb+wrZUXVnyvb+0AeF2ebI=";
      };
    };
  });
  meta = {
    description = "Library to match objects to lanelets";
  };
})
