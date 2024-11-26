{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_core";
  version = "1.2.1-6";
  src = finalAttrs.passthru.sources."lanelet2_core";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "lanelet2_core" = substituteSource {
        src = fetchgit {
          name = "lanelet2_core-source";
          url = "https://github.com/ros2-gbp/lanelet2-release.git";
          rev = "47f8a7582fc3a5b5ef4050e1053a3ed6c0d03d20";
          hash = "sha256-Nz/Uglhw2hDL1gfYqEdDLJHWEOErA4wg5rDzu3S1wik=";
        };
      };
    });
  };
  meta = {
    description = "Lanelet2 core module";
  };
})
