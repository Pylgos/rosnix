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
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mapem_ts_conversion";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-mapem-ts-coding etsi-its-mapem-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "50bd5126d60c6bb3289d01c78c5ea9478076deca";
        hash = "sha256-rkix+nlUSx0oVdRjgKzW2O/u9wDOC8sad8J8YCx6u28=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS MAPEMs (TS)";
  };
})
