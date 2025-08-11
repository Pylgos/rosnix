{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-primitives-conversion,
  etsi-its-spatem-ts-coding,
  etsi-its-spatem-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_spatem_ts_conversion";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-primitives-conversion etsi-its-spatem-ts-coding etsi-its-spatem-ts-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-spatem-ts-coding etsi-its-spatem-ts-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "1d0be3930fdc75fab5d1a8850a448c0929f283a8";
        hash = "sha256-l4kPLnfxVacuJW/Kohv/WUvBtRAYm5utLcvN6jpUwpY=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS SPATEMs (TS)";
  };
})
