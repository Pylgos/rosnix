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
  version = "2.1.0-1";
  src = finalAttrs.passthru.sources."gps_umd";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ gps-msgs gps-tools gpsd-client ];
  passthru.sources = mkSourceSet (sources: {
    "gps_umd" = substituteSource {
      src = fetchgit {
        name = "gps_umd-source";
        url = "https://github.com/ros2-gbp/gps_umd-release.git";
        rev = "7ca3a3a5f5c4ba115d67c938fa9df9dcfe4d6f7d";
        hash = "sha256-5NzZ6tNNIF2LltshNq4dlPbxEOOqR2aHoburXBLmv6E=";
      };
    };
  });
  meta = {
    description = "gps_umd metapackage";
  };
})
