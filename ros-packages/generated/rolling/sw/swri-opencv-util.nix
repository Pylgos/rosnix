{
  ament-cmake,
  buildAmentCmakePackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  swri-math-util,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_opencv_util";
  version = "3.8.1-1";
  src = finalAttrs.passthru.sources."swri_opencv_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge swri-math-util ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge swri-math-util ];
  passthru.sources = mkSourceSet (sources: {
    "swri_opencv_util" = substituteSource {
      src = fetchgit {
        name = "swri_opencv_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "00fe549d78fbbfc4200e53548f60039eb9dc052f";
        hash = "sha256-mJZwhitIl5cF84GKMODTzSG1x5jnjG2nl29DoTapqow=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used OpenCV functionality.\n  ";
  };
})
