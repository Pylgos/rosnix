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
  pname = "lanelet2_traffic_rules";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_traffic_rules";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_traffic_rules" = substituteSource {
      src = fetchgit {
        name = "lanelet2_traffic_rules-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "cab3d2d9315ab49c368620eae99f38e406d1463c";
        hash = "sha256-4z23mvgIB58yuFaSmCW3z5im50f74rrIYVTXxo8XYRA=";
      };
    };
  });
  meta = {
    description = "Package for interpreting traffic rules in a lanelet map";
  };
})
