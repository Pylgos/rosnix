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
  pname = "etsi_its_denm_ts_coding";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1f05902211a2a030d63f878e4f14486198582b90";
        hash = "sha256-8dCXCmX4+NCHaP1on7fskEXuwc1+4pL6IFE+jw1GvJ0=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs (TS) generated from ASN.1 using asn1c";
  };
})
