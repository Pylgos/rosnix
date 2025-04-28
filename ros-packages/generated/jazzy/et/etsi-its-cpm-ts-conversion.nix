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
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cpm-ts-coding etsi-its-cpm-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "11253897d037f3bc65746500d30f3ad7de62899e";
        hash = "sha256-tXHE/qnqgFNVb0I+ItpnfX85dmS2BbgzEVFXjVRY+bI=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CPMs (TS)";
  };
})
