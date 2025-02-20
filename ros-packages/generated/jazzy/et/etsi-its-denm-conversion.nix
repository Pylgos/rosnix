{
  ament-cmake,
  buildAmentCmakePackage,
  etsi-its-denm-coding,
  etsi-its-denm-msgs,
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
  pname = "etsi_its_denm_conversion";
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_conversion";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  propagatedBuildInputs = [ etsi-its-denm-coding etsi-its-denm-msgs etsi-its-primitives-conversion ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_conversion" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_conversion-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "107b7e2d3a460000032af2d844019e8770b0c22b";
        hash = "sha256-26hInE9IdjhYj8HudPNGdkJkW97NZKCyQM22ctH2PzY=";
      };
    };
  });
  meta = {
    description = "Conversion functions for converting ROS messages to and from ASN.1-encoded ETSI ITS DENMs";
  };
})
