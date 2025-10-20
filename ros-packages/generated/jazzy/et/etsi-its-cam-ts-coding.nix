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
  pname = "etsi_its_cam_ts_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e8cbff9349f0cd16f3847dcc2aed33c8804a78c0";
        hash = "sha256-YD1hedemRKKT2k67/NQZPipaOz/5jJwloZj8pk4xJAM=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CAMs (TS) generated from ASN.1 using asn1c";
  };
})
