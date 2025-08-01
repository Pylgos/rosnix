{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-core,
  lanelet2-io,
  lanelet2-matching,
  lanelet2-projection,
  lanelet2-routing,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_python";
  version = "1.2.1-7";
  src = finalAttrs.passthru.sources."lanelet2_python";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libboost-python-dev" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libboost-python-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_python" = substituteSource {
      src = fetchgit {
        name = "lanelet2_python-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "4d0d47101ba653801cf74ba09e64c78d51cc1d35";
        hash = "sha256-ShlQQ/+8TBL3/8PE/BeVaLtJW5l2B8FQO8eY06yg5Lc=";
      };
    };
  });
  meta = {
    description = "Python bindings for lanelet2";
  };
})
