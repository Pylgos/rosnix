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
  version = "5.0.10-1";
  src = finalAttrs.passthru.sources."image_pipeline";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration depth-image-proc image-proc image-publisher image-rotate image-view stereo-image-proc ];
  checkInputs = [ ament-cmake-lint-cmake ament-cmake-xmllint ament-lint-auto ];
  passthru.sources = mkSourceSet (sources: {
    "image_pipeline" = substituteSource {
      src = fetchgit {
        name = "image_pipeline-source";
        url = "https://github.com/ros2-gbp/image_pipeline-release.git";
        rev = "b349181150ed69e1f4089c4700c9bdbc4309d904";
        hash = "sha256-e3kY8Mc9joNs4xnvLJ7iyg8/ynw70puqTzBSEB3aShk=";
      };
    };
  });
  meta = {
    description = "image_pipeline fills the gap between getting raw images from a camera driver and higher-level vision processing.";
  };
})
