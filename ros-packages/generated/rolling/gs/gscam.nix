{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  camera-calibration-parsers,
  camera-info-manager,
  class-loader,
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
  version = "2.0.4-1";
  src = finalAttrs.passthru.sources."gscam";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "gstreamer1.0-plugins-good" "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ camera-calibration-parsers camera-info-manager class-loader image-transport rclcpp rclcpp-components sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "gstreamer1.0-plugins-good" "libgstreamer-plugins-base1.0-dev" "libgstreamer1.0-dev" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "gscam" = substituteSource {
      src = fetchgit {
        name = "gscam-source";
        url = "https://github.com/ros2-gbp/gscam-release.git";
        rev = "c16f31f52309101a6f58c62e76fe76df6ade7a0c";
        hash = "sha256-EYb4rxZYB3NVmg+ntGVjxjZsxQSiJ4k1VpHDozHmoJg=";
      };
    };
  });
  meta = {
    description = "\n    A ROS camera driver that uses gstreamer to connect to\n    devices such as webcams.\n  ";
  };
})
