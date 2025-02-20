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
  pname = "etsi_its_mapem_ts_coding";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "8f348e5a3f7ea51479778763db115e1003e86dd0";
        hash = "sha256-uLcbWlRrm3j3WSsWAX431/SZ+RZPMJHbke7vu0zPTLA=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS MAPEMs (TS) generated from ASN.1 using asn1c";
  };
})
