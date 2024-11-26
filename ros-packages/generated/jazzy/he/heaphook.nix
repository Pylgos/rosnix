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
  version = "0.1.1-3";
  src = finalAttrs.passthru.sources."heaphook";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tlsf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "heaphook" = substituteSource {
      src = fetchgit {
        name = "heaphook-source";
        url = "https://github.com/ros2-gbp/heaphook-release.git";
        rev = "3b17a1da870178e805963b7092d2cdad36d6e4be";
        hash = "sha256-muNY40LV1Jqtg043Lo1oCWIqz93a3zVaQ23jgFaEOPE=";
      };
    };
  });
  meta = {
    description = "Replace all the dynamic heap allocation functions by LD_PRELOAD";
  };
})
