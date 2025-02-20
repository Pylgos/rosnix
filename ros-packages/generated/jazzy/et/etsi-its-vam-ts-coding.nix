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
  version = "3.1.0-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a0128fdb29276edeffb07aea61d1287faa875f00";
        hash = "sha256-SfSn+bPJZrErdRdkNTBTax35T3MfVb0YaZ7ZYoDsHeU=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
