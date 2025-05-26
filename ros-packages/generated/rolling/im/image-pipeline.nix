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
  version = "7.0.0-1";
  src = finalAttrs.passthru.sources."image_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-calibration depth-image-proc image-proc image-publisher image-rotate image-view stereo-image-proc ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration depth-image-proc image-proc image-publisher image-rotate image-view stereo-image-proc ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "image_pipeline" = substituteSource {
      src = fetchgit {
        name = "image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "e1caa930a36ecd200097259409bb858632bc8f8e";
        hash = "sha256-+4C/zLkofLYj11BW1AMmhrxUN3yhk12kgv0sQkO8Uzo=";
      };
    };
  });
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
})
