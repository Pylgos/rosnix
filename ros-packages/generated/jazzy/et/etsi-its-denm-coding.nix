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
  version = "3.3.0-1";
  src = finalAttrs.passthru.sources."etsi_its_denm_coding";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "etsi_its_denm_coding" = substituteSource {
      src = fetchgit {
        name = "etsi_its_denm_coding-source";
        url = "https://github.com/ros2-gbp/etsi_its_messages-release.git";
        rev = "a9e32e22ca93878eed65b9fcbc3277e4c88ec76b";
        hash = "sha256-iY/ypLPT35HIgoZnhyUsMoBahZyLQN/ZriN1FiO7rps=";
      };
    };
  });
  meta = {
    description = "C++ compatible C source code for ETSI ITS DENMs generated from ASN.1 using asn1c";
  };
})
