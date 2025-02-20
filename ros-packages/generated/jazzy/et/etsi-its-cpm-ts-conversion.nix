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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-cpm-ts-coding etsi-its-cpm-ts-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_cpm_ts_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_cpm_ts_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "e7722e2470943d4b1b98f52aa07ef8e0642c010b";
        hash = "sha256-L6DOWiDam81c6cNTuH/r3wQ9+ZTExI8SsCjH0IDzUNg=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS CPMs (TS)";
  };
})
