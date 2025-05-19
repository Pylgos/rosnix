{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-cpm-ts-coding,
  etsi-its-cpm-ts-msgs,
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
  pname = "etsi_its_cpm_ts_conversion";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-cpm-ts-coding etsi-its-cpm-ts-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-cpm-ts-coding etsi-its-cpm-ts-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0d9e1d60fec555ad47f1499a57a604badde110ae";
        hash = "sha256-CKTriBiFHSrigw4EUc33Z4FiotsFFc9R3VUvAXb6V7s=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CPMs (TS)";
  };
})
