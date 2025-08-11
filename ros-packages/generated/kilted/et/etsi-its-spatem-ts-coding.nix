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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e5829860122f9f1e92645dfaf6d8a2e25a9e224b";
        hash = "sha256-xZsUG8Q7HAjanhcQGp/ZuB9QNiWnQmEDAxdXrst/0kk=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS SPATEMs (TS) generated from ASN.1 using asn1c";
  };
})
