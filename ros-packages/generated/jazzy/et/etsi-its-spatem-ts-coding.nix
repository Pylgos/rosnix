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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "4e297380c0d80fa6621012ed127e9eec843600c9";
        hash = "sha256-QGSpWbWM2MsFwuFmqxISCCxZGI89IpVCU0ongfRWAx8=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS SPATEMs (TS) generated from ASN.1 using asn1c";
  };
})
