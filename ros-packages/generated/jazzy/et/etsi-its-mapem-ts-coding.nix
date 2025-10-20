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
  pname = "etsi_its_mapem_ts_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1015653f8f2e712dc7a14a702792689ca75325c8";
        hash = "sha256-fzwo8oXsr18JMhm2MhUAeqwE1UjLb5cgNQLyJF6lGuw=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS MAPEMs (TS) generated from ASN.1 using asn1c";
  };
})
