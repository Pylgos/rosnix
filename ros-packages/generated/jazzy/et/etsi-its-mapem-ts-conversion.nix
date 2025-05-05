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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "2717773dca347fd8f6d9254363a1dfcd1962c3a6";
        hash = "sha256-WPNagOC0yWcrTSv/ismr9PtEZm9S8yUTM8sYiqS7DaQ=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS MAPEMs (TS)";
  };
})
