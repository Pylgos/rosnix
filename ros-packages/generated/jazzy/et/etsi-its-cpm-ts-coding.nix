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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "c48b0ada9620dd168a35ede7781575e077aa6996";
        hash = "sha256-3HNglE2akXCL5mj/LH7VvgiuLuIB1vqftHpvfw3R3MY=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS CPMs (TS) generated from ASN.1 using asn1c";
  };
})
