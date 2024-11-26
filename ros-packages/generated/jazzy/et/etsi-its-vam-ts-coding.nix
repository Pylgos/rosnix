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
  pname = "etsi_its_vam_ts_coding";
  version = "2.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru = {
    sources = mkSourceSet (sources: {
      "etsi_its_vam_ts_coding" = substituteSource {
        src = fetchgit {
          name = "etsi_its_vam_ts_coding-source";
          url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
          rev = "eaefbfad64b217baa9ebefa2a647c65b2904d3a7";
          hash = "sha256-LI/OP/9S2acqiAsk8dd11tRMYNJWButU4JZYvWreaVU=";
        };
      };
    });
  };
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
