{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-mcm-uulm-coding,
  etsi-its-mcm-uulm-msgs,
  etsi-its-primitives-conversion,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mcm_uulm_conversion";
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-mcm-uulm-coding etsi-its-mcm-uulm-msgs etsi-its-primitives-conversion ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-mcm-uulm-coding etsi-its-mcm-uulm-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "f755aa47c0152d99f3ece67504fe03b87cad4053";
        hash = "sha256-2NOT5wF8vQGCClrJTCBJIG5VotLg9Q+yFOi8QLHWV1s=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded UULM draft MCMs (TS)";
  };
})
