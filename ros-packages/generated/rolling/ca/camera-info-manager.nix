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
  version = "6.4.3-1";
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
        rev = "a4c8106da59eecc2c3cb2b4fd83c81183ceb5298";
        hash = "sha256-tuPn2R6zKML9fR3myfdOknc+X4LZZG01+XCbKySMc58=";
      };
    };
  });
  meta = {
    description = "\n\n     This package provides a C++ interface for camera calibration\n     information.  It provides CameraInfo, and handles SetCameraInfo\n     service requests, saving and restoring the camera calibration\n     data.\n\n  ";
  };
})
