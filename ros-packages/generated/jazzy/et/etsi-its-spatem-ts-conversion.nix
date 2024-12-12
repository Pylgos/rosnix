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
  version = "3.0.0-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-spatem-ts-coding etsi-its-spatem-ts-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "d831edcef4cb8268a1f87b68365e60e8f7594307";
        hash = "sha256-laBDBUylVmbzphoitW4VXFEHrApJkgmsFLi4wlC+Ro8=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS SPATEMs (TS)";
  };
})
