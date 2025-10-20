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
  pname = "etsi_its_cpm_ts_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "fd7e1d9f9e59626f9041fc9418d853e92effebf2";
        hash = "sha256-/abgfNH0g0S30BLA3keEXRePq/y7yW8weuAJA+m0TO0=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CPMs (TS) generated from ASN.1 using asn1c";
  };
})
