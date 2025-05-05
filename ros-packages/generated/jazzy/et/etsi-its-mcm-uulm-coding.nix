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
  version = "3.2.0-1";
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
        rev = "51290e9faa4b2e25e0cdee8aa1781fbbf155450b";
        hash = "sha256-58CtyPWrxcCbCvH7bkY+TaBn/VUnBBfDwnVjqbxnis8=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for draft MCM (TS) version of UULM generated from ASN.1 using asn1c";
  };
})
