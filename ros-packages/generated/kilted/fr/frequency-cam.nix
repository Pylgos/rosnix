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
  version = "3.1.0-1";
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
        rev = "eba0621c8ec7b471ac5898dd7c6271e24b3273a5";
        hash = "sha256-0KwejYq5Sn+UNR0bXKqaJE4qyCiBZkyV/5HfHKivA44=";
      };
    };
  });
  meta = {
    description = "frequency cam ROS/ROS2 package for event based cameras";
  };
})
