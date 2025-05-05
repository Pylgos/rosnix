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
  version = "3.2.0-1";
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
        rev = "5a3125ffb5cfe8e7e8e1bc8dde432580bde0e682";
        hash = "sha256-VyL1jFmvQebhhEKhD/MIpWiGOfe9U2ta6BLaLcS7j/w=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS VAMs (TS) generated from ASN.1 using asn1c";
  };
})
