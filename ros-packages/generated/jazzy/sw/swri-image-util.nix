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
  image-geometry,
  image-transport,
  message-filters,
  mkSourceSet,
  rcl-interfaces,
  rclcpp,
  rclcpp-components,
  rclpy,
  rosSystemPackages,
  substituteSource,
  swri-geometry-util,
  swri-math-util,
  swri-opencv-util,
  tf2,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "swri_image_util";
  version = "3.8.5-1";
  src = finalAttrs.passthru.sources."swri_image_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp camera-calibration-parsers cv-bridge image-geometry image-transport message-filters rcl-interfaces rclcpp rclcpp-components rclpy swri-geometry-util swri-math-util swri-opencv-util tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "eigen" "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-cpp camera-calibration-parsers cv-bridge image-geometry image-transport message-filters rcl-interfaces rclcpp rclcpp-components rclpy swri-geometry-util swri-math-util swri-opencv-util tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "eigen" "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_image_util" = substituteSource {
      src = fetchgit {
        name = "swri_image_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "18d9bb9a50980048e1cb2c1e83c9d8c27fced7c5";
        hash = "sha256-VsNogzit9r/i3icWEamZGZi0P1dUT5X+zGRQe8UcwcQ=";
      };
    };
  });
  meta = {
    description = "\n    A package of commonly image manipulation utilities.\n  ";
  };
})
