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
  pname = "etsi_its_mcm_uulm_coding";
  version = "3.2.1-1";
  src = finalAttrs.passthru.sources."etsi_its_mcm_uulm_coding";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ros-environment ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ros-environment ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_mcm_uulm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_mcm_uulm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "54566c5180510af34ab580909b0069ea082ef5cf";
        hash = "sha256-Fu3zO9UCqRCJat0D9J9c67fmSqvP82GGk23GHfPPQZw=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for draft MCM (TS) version of UULM generated from ASN.1 using asn1c";
  };
})
