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
  version = "3.4.0-1";
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
        rev = "1fce05c06d10c59d53a7d94588eadf9e2b11c5e3";
        hash = "sha256-FgKyYhSVP4//2dV+lq9XU35ErsDMwyz7PdGk4WhZytM=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded UULM draft MCMs (TS)";
  };
})
