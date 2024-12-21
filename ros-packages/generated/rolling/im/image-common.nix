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
  version = "6.1.0-1";
  src = finalAttrs.passthru.sources."image_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "a6a02fb45ef98456588b1019792976e328493088";
        hash = "sha256-pP9GHpJz+/KGtxV+HaFXLoCd8fwMWLbTG7PELfGLGig=";
      };
    };
  });
  meta = {
    description = "Common code for working with images in ROS.";
  };
})
