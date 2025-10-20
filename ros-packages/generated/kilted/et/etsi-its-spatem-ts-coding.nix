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
  pname = "etsi_its_spatem_ts_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "ff0f27971a76c18cd248972ad70f106186927b11";
        hash = "sha256-/DowO7eRHtx0gblwk+Ox89GAZJZv7wsILZto2NXWFMc=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS SPATEMs (TS) generated from ASN.1 using asn1c";
  };
})
