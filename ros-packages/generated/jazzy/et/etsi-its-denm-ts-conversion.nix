{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-denm-ts-coding,
  etsi-its-denm-ts-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_denm_ts_conversion";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-denm-ts-coding etsi-its-denm-ts-msgs etsi-its-primitives-conversion ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-denm-ts-coding etsi-its-denm-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "cc20de0b8db56fc521c496b413d522d60f4906ee";
        hash = "sha256-mJ3zG4z+HtwiUenGFBd57PKAk1lXfy2vLc1k6Q3G41k=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs (TS)";
  };
})
