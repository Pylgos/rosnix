{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-black,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  cv-bridge,
  event-camera-codecs,
  event-camera-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  fibar-lib,
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-transport,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "event_image_reconstruction_fibar";
  version = "3.0.3-1";
  src = finalAttrs.passthru.sources."event_image_reconstruction_fibar";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ cv-bridge event-camera-codecs event-camera-msgs fibar-lib image-transport rclcpp rclcpp-components rosbag2-cpp rosbag2-transport sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge event-camera-codecs event-camera-msgs fibar-lib image-transport rclcpp rclcpp-components rosbag2-cpp rosbag2-transport sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "event_image_reconstruction_fibar" = substituteSource {
      src = fetchgit {
        name = "event_image_reconstruction_fibar-source";
        url = "https://github.com/ros2-gbp/event_image_reconstruction_fibar-release.git";
        rev = "aa50cfd09c7df6fce0f4f70a44acbc201d191605";
        hash = "sha256-aF0Ru57RX2PLK1YptegaR4XxKLqlXO89bO2z2wuGW8U=";
      };
    };
  });
  meta = {
    description = "ROS package for synchronized image reconstruction from event frames";
  };
})
