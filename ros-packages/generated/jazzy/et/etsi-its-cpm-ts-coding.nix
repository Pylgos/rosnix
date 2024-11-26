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
  pname = "etsi_its_cpm_ts_coding";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_cpm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_cpm_ts_coding" = substituteSource {
        src = fetchgit {
          name = "etsi_its_cpm_ts_coding-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "3741c68d9a63eeb49360640415e3b2424b13b26a";
          hash = "sha256-DXtASV7ajqkvjIR2EVIkaDQR2eQR7yPotEOsmrnsZKk=";
        };
      };
    });
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS CPMs (TS) generated from ASN.1 using asn1c";
  };
})
