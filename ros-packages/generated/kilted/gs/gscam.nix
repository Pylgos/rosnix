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
  version = "2.0.2-5";
  src = finalAttrs.passthru.sources."gscam";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader cv-bridge image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gscam" = substituteSource {
      src = fetchgit {
        name = "gscam-source";
        url = "https://github.com/ros2-gbp/gscam-release.git";
        rev = "a5b056b0685a060fba548eb3f7abf7303dad73e6";
        hash = "sha256-CKQzdZxZ6OZeWkirhmcrfJhb0hNN0vSimKIRHSUDT3k=";
      };
    };
  });
  meta = {
    description = "\n    A ROS camera driver that uses gstreamer to connect to\n    devices such as webcams.\n  ";
  };
})
