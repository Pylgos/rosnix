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
  pname = "etsi_its_vam_ts_coding";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "532656584565926945809857b35b7987fda03236";
        hash = "sha256-wriVMUD3CJD/nj8jZItYSrnNFHDa1QdcLh+2eKsU6QA=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
