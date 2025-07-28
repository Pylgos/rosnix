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
  version = "2.8.0-1";
  src = finalAttrs.passthru.sources."rmf_demos_assets";
  nativeBuildInputs = [ ament-cmake ];
  buildInputs = [ ament-cmake ];
  passthru.sources = mkSourceSet (sources: {
    "rmf_demos_assets" = substituteSource {
      src = fetchgit {
        name = "rmf_demos_assets-source";
        url = "https://github.com/ros2-gbp/rmf_demos-release.git";
        rev = "19b7c7133999443e52f707b258ebfbcca759f17b";
        hash = "sha256-Us1Cce6TfF01OpD4wB1MORdfwnFCtEImuRmIGLPyG5Y=";
      };
    };
  });
  meta = {
    description = "Models and other media used for RMF demos";
  };
})
