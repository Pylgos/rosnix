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
  pname = "rmf_demos_assets";
  version = "2.8.2-3";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "d040a388c27e79e8037bca5d9d1a011554b063ed";
        hash = "sha256-jCVb5XyjEIBc6lCHZ87X9YMeN2OzllzQyFOGMdH2BZg=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})
