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
  version = "6.2.2-1";
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
        rev = "d850079fda23d485e24c9967fb8a32fb3d3ee197";
        hash = "sha256-vvhrobe7zjlgedH9WUUCaUvi4f/44G4vrt7v71xCcPs=";
      };
    };
  });
  meta = {
    description = "\n     camera_calibration_parsers contains routines for reading and writing camera calibration parameters.\n  ";
  };
})
