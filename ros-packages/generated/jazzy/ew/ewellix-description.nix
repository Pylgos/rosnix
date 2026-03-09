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
  pname = "ewellix_description";
  version = "0.2.1-2";
  src = finalAttrs.passthru.sources."ewellix_description";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "ewellix_description" = substituteSource {
      src = fetchgit {
        name = "ewellix_description-source";
        url = "https://github.com/clearpath-gbp/ewellix_lift_common-release.git";
        rev = "027b49be267ad15a6fa584091653c70a691b2f84";
        hash = "sha256-FKIZB8pGTeFpKul08SpK0aSGX/x5sDsiykpRsEjhkok=";
      };
    };
  });
  meta = {
    description = "Clearpath's description package for Ewellix TLT lifting columns";
  };
})
