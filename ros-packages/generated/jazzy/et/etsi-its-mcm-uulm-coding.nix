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
  pname = "etsi_its_mcm_uulm_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f5afba8a66865874ed820ea032094b86dfafca41";
        hash = "sha256-4a2nzWEk7cM0kvMKJp5BtDYoQ0nxrBYeXAfj92+mEmc=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for draft MCM (TS) version of UULM generated from ASN.1 using asn1c";
  };
})
