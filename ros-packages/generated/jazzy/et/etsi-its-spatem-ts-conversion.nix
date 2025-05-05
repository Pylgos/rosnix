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
  version = "3.2.0-1";
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
        rev = "cb79085c0136b70530febf28bc8335deb1dd7d33";
        hash = "sha256-of40tu9gcy2rguiaqk6sttthITSsAXsJntwOGAyeleY=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS SPATEMs (TS)";
  };
})
