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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0958c7510095b0ea8512051bb40032f19b1677de";
        hash = "sha256-zKt6H0N41ByLowACbfeSR/Mwyx+3dgqQKGutKQpfrTM=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for draft MCM (TS) version of UULM generated from ASN.1 using asn1c";
  };
})
