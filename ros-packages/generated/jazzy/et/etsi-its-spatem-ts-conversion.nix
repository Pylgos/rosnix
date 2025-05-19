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
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_spatem_ts_conversion";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-primitives-conversion etsi-its-spatem-ts-coding etsi-its-spatem-ts-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-spatem-ts-coding etsi-its-spatem-ts-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "38794384147b8f5cb368eae484ab4e5615efe4d7";
        hash = "sha256-6BMGqafDoC8PggSHFqY/GGyKWkunJVBPcMNhEy8n2IM=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS SPATEMs (TS)";
  };
})
