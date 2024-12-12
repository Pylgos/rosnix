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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "c46f5702439e6742083cae59cf9a45bb607c6b91";
        hash = "sha256-MF5GgXBlUE6aUDY7KMJQIJCcHeykQKC/twrYjvVVGmM=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS MAPEMs (TS)";
  };
})
