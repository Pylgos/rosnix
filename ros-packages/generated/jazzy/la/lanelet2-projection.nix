{
  ament-cmake-core,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  lanelet2-io,
  mkSourceSet,
  mrt-cmake-modules,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "lanelet2_projection";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_projection";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ lanelet2-io mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "geographiclib" ]; };
  buildInputs = [ ament-cmake-core ];
  propagatedBuildInputs = [ lanelet2-io mrt-cmake-modules ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "geographiclib" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "lanelet2_projection" = substituteSource {
      src = fetchgit {
        name = "lanelet2_projection-source";
        url = "https://github.com/ros2-gbp/lanelet2-release.git";
        rev = "52590ef39bce10c356693a799124c8a09637168b";
        hash = "sha256-o4Gx/d7ijKvebHUq8BO78HeTfCKTIkE1raVOjESdhR4=";
      };
    };
  });
  meta = {
    description = "Lanelet2 projection library for lat/lon to local x/y conversion";
  };
})
