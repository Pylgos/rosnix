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
  version = "3.7.6-1";
  src = finalAttrs.passthru.sources."swri_image_util";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pkg-config" ]; };
  propagatedNativeBuildInputs = [ ament-index-cpp camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport message-filters nav-msgs rclcpp rclcpp-components rclpy std-msgs swri-geometry-util swri-math-util swri-opencv-util swri-roscpp tf2 ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "eigen" ]; };
  buildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pkg-config" ]; };
  propagatedBuildInputs = [ ament-index-cpp camera-calibration-parsers cv-bridge geometry-msgs image-geometry image-transport message-filters nav-msgs rclcpp rclcpp-components rclpy std-msgs swri-geometry-util swri-math-util swri-opencv-util swri-roscpp tf2 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "eigen" ]; };
  checkInputs = [ ament-cmake-gtest ];
  passthru.sources = mkSourceSet (sources: {
    "swri_image_util" = substituteSource {
      src = fetchgit {
        name = "swri_image_util-source";
        url = "https://github.com/ros2-gbp/marti_common-release.git";
        rev = "41676f6c024456815d4ba19b0a37c84e48d7a3c0";
        hash = "sha256-SGsQSIWbYEjBJDAgdoQsaQngjXxlkjqEkBPRWNUfhQk=";
      };
    };
  });
  meta = {
    description = "\n    A package of commonly image manipulation utilities.\n  ";
  };
})
