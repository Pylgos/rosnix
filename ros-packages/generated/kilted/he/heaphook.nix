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
  propagatedNativeBuildInputs = [ tlsf ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ tlsf ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "heaphook" = substituteSource {
      src = fetchgit {
        name = "heaphook-source";
        url = "https://github.com/ros2-gbp/heaphook-release.git";
        rev = "cb916f4cc62acdc48a70f6f5b0089006aa21952c";
        hash = "sha256-muNY40LV1Jqtg043Lo1oCWIqz93a3zVaQ23jgFaEOPE=";
      };
    };
  });
  meta = {
    description = "Replace all the dynamic heap allocation functions by LD_PRELOAD";
  };
})
