{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  ros-environment,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_denm_coding";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_denm_coding" = substituteSource {
        src = fetchgit {
          name = "etsi_its_denm_coding-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "1075a65c0dadb0a65580e9d3d6584a9fbee8901b";
          hash = "sha256-8N/vw2ZVeb4Gw74GNrBz4fYJJ2biG4EAP8WeVmX22z4=";
        };
      };
    });
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs generated from ASN.1 using asn1c";
  };
})
