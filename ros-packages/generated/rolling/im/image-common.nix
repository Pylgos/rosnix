{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  camera-info-manager,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "image_common";
  version = "6.0.3-1";
  src = finalAttrs.passthru.sources."image_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "0c5ec561828df4d9b60eb346200dac64f13c3872";
        hash = "sha256-UDAcYntLWcKRwEWE0s/OpKgOvAwmf0hajLdSRg9qW+U=";
      };
    };
  });
  meta = {
    description = "Common code for working with images in ROS.";
  };
})
