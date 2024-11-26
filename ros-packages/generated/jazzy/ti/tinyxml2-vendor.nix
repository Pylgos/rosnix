{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "tinyxml2_vendor";
  version = "0.9.1-3";
  src = finalAttrs.passthru.sources."tinyxml2_vendor";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml2" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "tinyxml2_vendor" = substituteSource {
        src = fetchgit {
          name = "tinyxml2_vendor-source";
          url = "https://github.com/ros2-gbp/tinyxml2_vendor-release.git";
          rev = "155ed531ad0a75b6f9e1d1ee39cd80fb47e9e341";
          hash = "sha256-ptCYnrl38I2LTVvOgSO8OXjxfgGAen17kQSYDOgZZRQ=";
        };
      };
    });
  };
  meta = {
    description = "Wrapper around tinyxml2, providing nothing but a dependency on tinyxml2, on some systems. On others, it provides a fixed CMake module or even an ExternalProject build of tinyxml2.";
  };
})
