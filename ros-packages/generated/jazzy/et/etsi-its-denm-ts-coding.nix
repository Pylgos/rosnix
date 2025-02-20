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
  pname = "etsi_its_denm_ts_coding";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "11768f4a18b8c7505f9b3130f9ac0082bddd2ca0";
        hash = "sha256-srMcjFhD8uw75WwOtibHeHDYSRhLAKR8o/oLXF/xdgQ=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs (TS) generated from ASN.1 using asn1c";
  };
})
