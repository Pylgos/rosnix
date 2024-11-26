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
  version = "5.1.4-1";
  src = finalAttrs.passthru.sources."image_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "acc5e443a8ef4111b48a5adf86e358873e77eba0";
        hash = "sha256-zEuvWBkITR9VlL546Qsx9vSbwzkK+uzb4FZwz78NPtQ=";
      };
    };
  });
  meta = {
    description = "Common code for working with images in ROS.";
  };
})
