{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_spatem_ts_coding";
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "02b4b33788f0bd608c87d25ac4698f1cbedf39e3";
        hash = "sha256-CyPfl7tNKqJkPSYN5rTHoaVjfsrsiiLUqVu/Idbj8uM=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS SPATEMs (TS) generated from ASN.1 using asn1c";
  };
})
