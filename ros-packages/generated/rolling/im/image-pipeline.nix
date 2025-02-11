{
  ament-cmake,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint-auto,
  buildAmentCmakePackage,
  camera-calibration,
  depth-image-proc,
  fetchgit,
  fetchurl,
  fetchzip,
  image-proc,
  image-publisher,
  image-rotate,
  image-view,
  mkSourceSet,
  rosSystemPackages,
  stereo-image-proc,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_pipeline";
  version = "6.0.8-1";
  src = finalAttrs.passthru.sources."image_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration depth-image-proc image-proc image-publisher image-rotate image-view stereo-image-proc ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "image_pipeline" = substituteSource {
      src = fetchgit {
        name = "image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "4963ccb2796e72add3a02b8730905df080767a28";
        hash = "sha256-UKIDdHKYusW9Z+NF9BHeAScBRmUVspFEKrA9JrL+aNE=";
      };
    };
  });
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
})
