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
  pname = "etsi_its_denm_ts_coding";
  version = "3.2.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "0bca717c3c4dea976edac8e803f65c9de524ed19";
        hash = "sha256-czKJ55XH5UWWIEzzD/cS6ir0t9Yrun1PM0wvwvT5ZyA=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs (TS) generated from ASN.1 using asn1c";
  };
})
