{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  camera-info-manager,
  class-loader,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "gscam";
  version = "2.0.2-4";
  src = finalAttrs.passthru.sources."gscam";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru = {
    sources = mkSourceSet (sources: {
      "gscam" = substituteSource {
        src = fetchgit {
          name = "gscam-source";
          url = "https://github.com/ros2-gbp/gscam-release.git";
          rev = "e8c1c1524a3a80ab89425305ce63f338fdb0f0a5";
          hash = "sha256-CKQzdZxZ6OZeWkirhmcrfJhb0hNN0vSimKIRHSUDT3k=";
        };
      };
    });
  };
  meta = {
    description = "A ROS camera driver that uses gstreamer to connect to devices such as webcams.";
  };
})
