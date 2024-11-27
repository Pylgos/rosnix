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
  version = "5.1.5-1";
  src = finalAttrs.passthru.sources."camera_info_manager";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ ament-index-cpp camera-calibration-parsers rclcpp rclcpp-lifecycle rcpputils sensor-msgs ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "camera_info_manager" = substituteSource {
      src = fetchgit {
        name = "camera_info_manager-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "d475413faa4f253a1e804a0ca86f0f62d01c96f8";
        hash = "sha256-PIHBvXlbnmHwnZD+lWUrfZ5onQGdVgZeedvx3PUAMwk=";
      };
    };
  });
  meta = {
    description = "This package provides a C++ interface for camera calibration information. It provides CameraInfo, and handles SetCameraInfo service requests, saving and restoring the camera calibration data.";
  };
})
