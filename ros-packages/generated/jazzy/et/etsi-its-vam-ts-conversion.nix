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
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_vam_ts_conversion";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-primitives-conversion etsi-its-vam-ts-coding etsi-its-vam-ts-msgs ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "501f7045ddb13359c88551cdb809bd2b3c12a5ae";
        hash = "sha256-CT7A7eu4+YAJMWFICIjyZwCK7R3LIXhnm60QBKLIDUI=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS VAMs (TS)";
  };
})
