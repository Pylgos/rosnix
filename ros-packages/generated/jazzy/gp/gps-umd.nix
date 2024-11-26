{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  gps-msgs,
  gps-tools,
  gpsd-client,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gps_umd";
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."gps_umd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  passthru.sources = mkSourceSet (sources: {
    "gps_umd" = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "6869f2a2090f77970d0471beae53cd320b0ccbd0";
        hash = "sha256-57CxBkAd2u2S/EZrm8p1C0JPGoFAlEsVq2jYjMWBz5U=";
      };
    };
  });
  meta = {
    description = "gps_umd metapackage";
  };
})
