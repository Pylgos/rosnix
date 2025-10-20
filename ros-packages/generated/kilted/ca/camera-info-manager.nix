{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-lifecycle,
  rcpputils,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_info_manager";
  version = "6.1.3-1";
  src = finalAttrs.passthru.sources."camera_info_manager";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ ament-index-cpp camera-calibration-parsers rclcpp rclcpp-lifecycle rcpputils sensor-msgs ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp camera-calibration-parsers rclcpp rclcpp-lifecycle rcpputils sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "camera_info_manager" = substituteSource {
      src = fetchgit {
        name = "camera_info_manager-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "0843d4347453457228236cc3512ea7ce5040aaad";
        hash = "sha256-SxY2giddkPJ5O7EPzt3JRnGi/+HEbO4myv8+WzU896k=";
      };
    };
  });
  meta = {
    description = "\n\n     This package provides a C++ interface for camera calibration\n     information.  It provides CameraInfo, and handles SetCameraInfo\n     service requests, saving and restoring the camera calibration\n     data.\n\n  ";
  };
})
