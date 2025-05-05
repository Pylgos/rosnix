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
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_core";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_core" = substituteSource {
      src = fetchgit {
        name = "lanelet2_core-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "5630708c5df854376fa1a16947d6172dc6468b1f";
        hash = "sha256-Nz/Uglhw2hDL1gfYqEdDLJHWEOErA4wg5rDzu3S1wik=";
      };
    };
  });
  meta = {
    description = "Lanelet2 core module";
  };
})
