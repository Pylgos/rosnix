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
  version = "3.4.0-1";
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
        rev = "746dba1bec6128d68e9f7b12b28b2b9341d760b9";
        hash = "sha256-S9lG3b5deTJl0vdPxt49FGxOm6/7v9Q93CidMhDjXSA=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS SPATEMs (TS)";
  };
})
