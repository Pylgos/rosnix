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
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_mcm_uulm_conversion";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ etsi-its-mcm-uulm-coding etsi-its-mcm-uulm-msgs etsi-its-primitives-conversion ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ etsi-its-mcm-uulm-coding etsi-its-mcm-uulm-msgs etsi-its-primitives-conversion ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "cfa7f4c3890c0f2ac768f23878f2024880c2b50f";
        hash = "sha256-GpxOLgFwvKiEHzKKtA/vdTa+btwdSuPzEKoUtiZ7MH8=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded UULM draft MCMs (TS)";
  };
})
