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
  pname = "lanelet2_io";
  version = "1.2.1-1";
  src = finalAttrs.passthru.sources."lanelet2_io";
  nativeBuildInputs = [ ament-cmake-core ];
  propagatedNativeBuildInputs = [ mrt-cmake-modules ];
  propagatedBuildInputs = [ lanelet2-core ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "pugixml-dev" ]; };
  checkInputs = rosSystemPackages.getPackages { forBuildInputs = [ "gtest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "lanelet2_io" = substituteSource {
        src = fetchgit {
          name = "lanelet2_io-source";
          url = "https://github.com/ros2-gbp/lanelet2-release.git";
          rev = "3a62e4d061574a0d62757874c354ffaf6e3a4128";
          hash = "sha256-B0AHMNYejPsaUhx0+RpURz56wZfnlpEXWZ/KnhdUuOQ=";
        };
      };
    });
  };
  meta = {
    description = "Parser/Writer module for lanelet2";
  };
})
