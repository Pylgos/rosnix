{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  tlsf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "heaphook";
  version = "0.1.1-2";
  src = finalAttrs.passthru.sources."heaphook";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tlsf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "heaphook" = substituteSource {
      src = fetchgit {
        name = "heaphook-source";
        url = "https://github.com/ros2-gbp/heaphook-release.git";
        rev = "0dfc6a7bc97643a1c10712d92295746dc868ca44";
        hash = "sha256-muNY40LV1Jqtg043Lo1oCWIqz93a3zVaQ23jgFaEOPE=";
      };
    };
  });
  meta = {
    description = "Replace all the dynamic heap allocation functions by LD_PRELOAD";
  };
})
