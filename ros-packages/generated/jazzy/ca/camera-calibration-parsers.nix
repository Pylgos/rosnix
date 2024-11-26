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
  version = "5.1.4-1";
  src = finalAttrs.passthru.sources."camera_calibration_parsers";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ rclcpp sensor-msgs yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "camera_calibration_parsers" = substituteSource {
        src = fetchgit {
          name = "camera_calibration_parsers-source";
          url = "https://github.com/ros2-gbp/image_common-release.git";
          rev = "07de0f00f55464e3c3ddbb662d24eed0e6b29281";
          hash = "sha256-wKn7KsxZviY/E9GTcDyMdCTVi7lAfKUWho7uaTIbx40=";
        };
      };
    });
  };
  meta = {
    description = "camera_calibration_parsers contains routines for reading and writing camera calibration parameters.";
  };
})
