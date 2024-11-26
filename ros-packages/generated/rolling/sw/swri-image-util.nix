{
  ament-cmake,
  ament-cmake-gtest,
  ament-index-cpp,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  image-geometry,
  image-transport,
  message-filters,
  mkSourceSet,
  nav-msgs,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  swri-geometry-util,
  swri-math-util,
  swri-opencv-util,
  swri-roscpp,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_image_util";
  version = "3.7.3-1";
  src = finalAttrs.passthru.sources."swri_image_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-cpp camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport message-filters nav-msgs rclcpp rclcpp-components rclpy std-msgs swri-geometry-util swri-math-util swri-opencv-util swri-roscpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru = {
    sources = mkSourceSet (sources: {
      "swri_image_util" = substituteSource {
        src = fetchgit {
          name = "swri_image_util-source";
          url = "https://github.com/ros2-gbp/marti_common-release.git";
          rev = "b6519c551f52fcbf0e635aa3bb406ac8e810940b";
          hash = "sha256-j9Mganqzf50jti2W8E9b2PZAepIFOzUkxNgzcua8Tyw=";
        };
      };
    });
  };
  meta = {
    description = "A package of commonly image manipulation utilities.";
  };
})
