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
  pname = "etsi_its_mapem_ts_coding";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_mapem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mapem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mapem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "95f18d29981059c1a1a20c594c843d5623ccbb93";
        hash = "sha256-Kb4ZvSthPzr169ZCAD/JhibaJljEu46o5OyLP4+hII8=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS MAPEMs (TS) generated from ASN.1 using asn1c";
  };
})
