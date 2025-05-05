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
  lanelet2-python,
  lanelet2-routing,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_examples";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_examples";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ros2cli ];
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules mrt-cmake-modules ros2cli ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_examples" = substituteSource {
      src = fetchgit {
        name = "lanelet2_examples-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "e82ea17278cb8ee2b78d0a81a2b1e265f12f601c";
        hash = "sha256-jbMdHabSoOnjj7zKI54sz2P3Nrq8NRpYCHYb7pekzX0=";
      };
    };
  });
  meta = {
    description = "Examples for working with Lanelet2";
  };
})
