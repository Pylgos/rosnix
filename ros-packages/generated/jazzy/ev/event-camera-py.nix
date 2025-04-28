{
  ament-cmake,
  ament-cmake-auto,
  ament-cmake-clang-format,
  ament-cmake-pytest,
  ament-cmake-python,
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
  pybind11-vendor,
  python-cmake-module,
  rclpy,
  ros-environment,
  rosSystemPackages,
  rosbag2-py,
  rosbag2-storage-default-plugins,
  rosidl-runtime-py,
  rpyutils,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "event_camera_py";
  version = "2.0.0-1";
  src = finalAttrs.passthru.sources."event_camera_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ ros-environment rpyutils ];
  propagatedBuildInputs = [ event-camera-codecs event-camera-msgs pybind11-vendor ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-pytest ament-lint-auto ament-lint-common rclpy rosbag2-py rosbag2-storage-default-plugins rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  passthru.sources = mkSourceSet (sources: {
    "event_camera_py" = substituteSource {
      src = fetchgit {
        name = "event_camera_py-source";
        url = "https://github.com/ros2-gbp/event_camera_py-release.git";
        rev = "498500e346a147ee71fbed342875e8818ddab741";
        hash = "sha256-Xg0LT/LRyfJ8agVwAbCq7/EXKvA3AncwugHRo4JpYZ4=";
      };
    };
  });
  meta = {
    description = "Python access for event_camera_msgs.";
  };
})
