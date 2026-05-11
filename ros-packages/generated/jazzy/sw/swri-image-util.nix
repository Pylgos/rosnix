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
  version = "3.8.9-1";
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
        rev = "6a6a2a27d6c181549ccfd1ecc02a2ca64a7b54fe";
        hash = "sha256-kWGb0AwjNTAx15UYd2tYqM/wSTPGGvjvbdFLnR0wmr8=";
      };
    };
  });
  meta = {
    description = "\n    A package of commonly image manipulation utilities.\n  ";
  };
})
