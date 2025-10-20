{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "etsi_its_denm_coding";
  version = "3.4.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "aee79a0a22bd79d64c97c53e2fd1add6a6016931";
        hash = "sha256-MPCx/XWKJbAV8IY1dEiBPqmAbEsUwOC9Haf5Ky9c/2s=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs generated from ASN.1 using asn1c";
  };
})
