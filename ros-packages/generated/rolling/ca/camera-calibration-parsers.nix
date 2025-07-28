{
  ament-cmake-gtest,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "camera_calibration_parsers";
  version = "6.3.0-1";
  src = finalAttrs.passthru.sources."camera_calibration_parsers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ rclcpp sensor-msgs yaml-cpp-vendor ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp sensor-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "camera_calibration_parsers" = substituteSource {
      src = fetchgit {
        name = "camera_calibration_parsers-source";
        url = "https://github.com/ros2-gbp/image_common-release.git";
        rev = "908bc1b440faf06c7cc4214af5247a5f5b7967df";
        hash = "sha256-+VBmag8lKl8CWaEItWmo3Bm6JgbGXtabMLGjGwDYyRc=";
      };
    };
  });
  meta = {
    description = "\n     camera_calibration_parsers contains routines for reading and writing camera calibration parameters.\n  ";
  };
})
