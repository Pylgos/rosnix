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
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_opencv_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge swri-math-util ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_opencv_util" = substituteSource {
      src = fetchgit {
        name = "swri_opencv_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "c7d46bed3e778008cc382894ad1de167a83f44b9";
        hash = "sha256-cF6WQaI1Jha+yklpXxMNrlyqYLn0Ua1PtuJg/aIucrk=";
      };
    };
  });
  meta = {
    description = "A package with commonly used OpenCV functionality.";
  };
})
