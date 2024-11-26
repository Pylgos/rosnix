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
  lanelet2-routing,
  lanelet2-traffic-rules,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_validation";
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_validation";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core lanelet2-io lanelet2-projection lanelet2-routing lanelet2-traffic-rules ];
  checkInputs = [ lanelet2-maps ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_validation" = substituteSource {
      src = fetchgit {
        name = "lanelet2_validation-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "3907f243dc40d71411ca18061f8a68c323d0d902";
        hash = "sha256-tAvB7lkQDSwBBpXUvHkuAzwo2zlSEbMsZr1Gy8AElXI=";
      };
    };
  });
  meta = {
    description = "Package for sanitizing lanelet maps";
  };
})
