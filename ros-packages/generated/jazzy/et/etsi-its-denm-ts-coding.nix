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
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "20bd169163f723c3f10612d946f3135fb7cf14cb";
        hash = "sha256-MqCvshUz4wFsT+V6HBWptlFC000VAtMAyeUBvfnuNO0=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs (TS) generated from ASN.1 using asn1c";
  };
})
