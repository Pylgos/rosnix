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
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_denm_ts_conversion";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-denm-ts-coding etsi-its-denm-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "80cb9dabbdc31d1671cb36ad9c4dbc453e3461c3";
        hash = "sha256-ikT6A217L4Z7qSEqAtd2R6aFFLddkhPTjI4V7+vBOZY=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs (TS)";
  };
})
