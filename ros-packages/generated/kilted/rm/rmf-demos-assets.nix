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
  version = "2.5.0-3";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "70adc839b88f7fc205ee97ab55eda8f1c1bfbfef";
        hash = "sha256-w/DPSZl37tSMmo3l4l2ITcMb6EDWWS5DyQMCi4/5/JE=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})
