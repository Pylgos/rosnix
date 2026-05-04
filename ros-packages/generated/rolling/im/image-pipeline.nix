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
  version = "7.1.3-2";
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
        rev = "c83b82eaf600ee681b0a4dade55e2de297bc624b";
        hash = "sha256-7qQ7VxngNoVaNdqJBIm7QOzB4XD1tnNy8ax9B2hXgFE=";
      };
    };
  });
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
})
