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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-denm-ts-coding etsi-its-denm-ts-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-denm-ts-coding etsi-its-denm-ts-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "ccf1a1fc29a3cd6cb5ca8f5576bca3adcae61f01";
        hash = "sha256-RYtJ3QR5tP7Wa0rBC806CSyi362uhcyyzFoOuRIznmY=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs (TS)";
  };
})
