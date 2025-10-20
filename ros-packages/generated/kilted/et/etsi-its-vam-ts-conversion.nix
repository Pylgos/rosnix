{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-primitives-conversion,
  etsi-its-vam-ts-coding,
  etsi-its-vam-ts-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_vam_ts_conversion";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "336ce2a57659cb555efe2075ad9a44f759f6a530";
        hash = "sha256-Nu7eOA/x6D7OGNQoO6pIFnAdHLYdBPvf1LWVXP+qu6c=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS VAMs (TS)";
  };
})
