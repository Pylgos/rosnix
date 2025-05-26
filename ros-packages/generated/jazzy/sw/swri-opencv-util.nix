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
  version = "3.7.6-1";
  src = finalAttrs.passthru.sources."swri_opencv_util";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ cv-bridge swri-math-util ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ cv-bridge swri-math-util ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  passthru.sources = mkSourceSet (sources: {
    "swri_opencv_util" = substituteSource {
      src = fetchgit {
        name = "swri_opencv_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "67fb87538b549a861f54fbee1e39664afc2b60fa";
        hash = "sha256-rLxPaTkjv9nE9z+Mw7clZSNhr/dDh9vb2jnT1VGSwyg=";
      };
    };
  });
  meta = {
    description = "\n    A package with commonly used OpenCV functionality.\n  ";
  };
})
