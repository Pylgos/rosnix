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
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."image_common";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager image-transport ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "image_common" = substituteSource {
      src = fetchgit {
        name = "image_common-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "758a1e49c77acdf7b9f22fd80eebc79f07d33358";
        hash = "sha256-CPT4qnNtuEAOkwsjoK3DvG73USGsWPvMygKo86aWiZA=";
      };
    };
  });
  meta = {
    description = "Common code for working with images in ROS.";
  };
})
