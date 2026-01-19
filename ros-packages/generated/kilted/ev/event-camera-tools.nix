{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-black,
  ament-cmake-clang-format,
  ament-cmake-ros,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  event-camera-codecs,
  event-camera-msgs,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  ros-environment,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "event_camera_tools";
  version = "3.1.1-1";
  src = finalAttrs.passthru.sources."event_camera_tools";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedNativeBuildInputs = [ event-camera-codecs event-camera-msgs rclcpp rclcpp-components rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "libopencv-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-auto ament-cmake-ros ros-environment ];
  propagatedBuildInputs = [ event-camera-codecs event-camera-msgs rclcpp rclcpp-components rosbag2-cpp rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "libopencv-dev" ]; };
  checkInputs = [ ament-cmake-black ament-cmake-clang-format ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "event_camera_tools" = substituteSource {
      src = fetchgit {
        name = "event_camera_tools-source";
        url = "https://github.com/ros2-gbp/event_camera_tools-release.git";
        rev = "6983c6e0807d9e5941a8e8eb07bcb49fd9b4e9eb";
        hash = "sha256-K4RoQJBY0PwclGPCV+0BlKUmuTIk+iM7AklJOsbE8zc=";
      };
    };
  });
  meta = {
    description = "package with ROS1 and ROS2 tools related to event_camera_msgs";
  };
})
