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
  version = "2.8.2-2";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "4cfe0a328c15296b55b96fe0bdc41a7221cb8941";
        hash = "sha256-jCVb5XyjEIBc6lCHZ87X9YMeN2OzllzQyFOGMdH2BZg=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})
