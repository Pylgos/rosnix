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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_vam_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_vam_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_vam_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "2b4ebf6eb8951076f35987003da3d81b1e934e37";
        hash = "sha256-0qRfSJwaz864u9P1ll61y4DelL+LhbI30N3oLO2GK7M=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
