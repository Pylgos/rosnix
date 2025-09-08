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
  version = "7.1.1-1";
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
        rev = "86bc0e5ae0ff8a833c511bc11f79380e5d6f59f4";
        hash = "sha256-5wcPn0/UQ8iXIYlu07fHHOJAPcxHNFgff9s5DVOsUw8=";
      };
    };
  });
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
})
