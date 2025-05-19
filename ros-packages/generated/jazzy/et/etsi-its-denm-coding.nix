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
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "eb1da21cbff6d41cf162c3033edb07a1ea4b4a1e";
        hash = "sha256-D6OyI+p15R5A1nvH6pPmGT8G4jDmn84IBLLisXMRXSk=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs generated from ASN.1 using asn1c";
  };
})
