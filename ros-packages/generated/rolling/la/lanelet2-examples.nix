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
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_examples";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-matching lanelet2-projection lanelet2-python lanelet2-routing lanelet2-traffic-rules ros2cli ];
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_examples" = substituteSource {
      src = fetchgit {
        name = "lanelet2_examples-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "3046775d4ef1580e110ffe268ac51e8ccf6b358b";
        hash = "sha256-jbMdHabSoOnjj7zKI54sz2P3Nrq8NRpYCHYb7pekzX0=";
      };
    };
  });
  meta = {
    description = "Examples for working with Lanelet2";
  };
})
