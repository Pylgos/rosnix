{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-mapem-ts-coding,
  etsi-its-mapem-ts-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mapem_ts_conversion";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "24c37dfe5af8239615a962b17f706530e1264aed";
        hash = "sha256-KV8dDUEGsMqXzWrrdBTNMtCNQmFiyfsEPeoFGyQW6k0=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS MAPEMs (TS)";
  };
})
