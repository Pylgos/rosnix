{
  ament-cmake,
  ament-cmake-auto,
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
  image-transport,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rosSystemPackages,
  rosbag2-cpp,
  std-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "frequency_cam";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."frequency_cam";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedNativeBuildInputs = [ cv-bridge event-camera-codecs event-camera-msgs image-transport rclcpp rclcpp-components rosbag2-cpp std-msgs ];
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ];
  propagatedBuildInputs = [ cv-bridge event-camera-codecs event-camera-msgs image-transport rclcpp rclcpp-components rosbag2-cpp std-msgs ];
  checkInputs = [ ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "frequency_cam" = substituteSource {
      src = fetchgit {
        name = "frequency_cam-source";
        url = "https://github.com/ros2-gbp/frequency_cam-release.git";
        rev = "7a3112d2f23f60b6e2ac387899995932d060589e";
        hash = "sha256-zXHWPLmJOAdFKksgf5rsP5cnqKzr1m/tNaPe7tUL0S4=";
      };
    };
  });
  meta = {
    description = "frequency cam ROS/ROS2 package for event based cameras";
  };
})
