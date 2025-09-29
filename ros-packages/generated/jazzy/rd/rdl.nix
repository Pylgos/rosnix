{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rdl-benchmark,
  rdl-dynamics,
  rdl-urdfreader,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rdl";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."rdl";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rdl-benchmark rdl-dynamics rdl-urdfreader ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rdl-benchmark rdl-dynamics rdl-urdfreader ];
  passthru.sources = mkSourceSet (sources: {
    "rdl" = substituteSource {
      src = fetchgit {
        name = "rdl-source";
        url = "https://github.com/jlack1987/rdl-release.git";
        rev = "6e0245b7759a5b17b07e65596d8021b0ef6a8957";
        hash = "sha256-GkhKHsmahEVUmxxi0WvtZE+X3WwqCnd9XN13N/Ur7MQ=";
      };
    };
  });
  meta = {
    description = "The rdl meta-package";
  };
})
