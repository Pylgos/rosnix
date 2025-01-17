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
  version = "2.3.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "1f8ce93b7ca6a8218d3cb982be75f36726cb74ee";
        hash = "sha256-LfZZoAvwchvGMZ1D0DXNLX2boTwnTHj9rJzumglmrdQ=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})
