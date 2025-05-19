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
  pname = "etsi_its_spatem_ts_coding";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_spatem_ts_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_spatem_ts_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_spatem_ts_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a2e4bb604f3750e0faac5884371c338d76ea911c";
        hash = "sha256-kNPFXsHOnKSQ4q9Zfc8axJnpdA6NtXEWUi5sc67Uz6k=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS SPATEMs (TS) generated from ASN.1 using asn1c";
  };
})
