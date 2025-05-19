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
  version = "3.2.1-1";
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
        rev = "66b6e0e6efebf1b696588f0b73e08163d70a8524";
        hash = "sha256-L42zed/x0cLrFRLCjPC3yWJ16WGo0DmTVwJr4LURZcM=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs (TS) generated from ASN.1 using asn1c";
  };
})
