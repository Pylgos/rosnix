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
  version = "1.3.6-1";
  src = finalAttrs.passthru.sources."event_camera_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-auto ament-cmake-python ament-cmake-ros python-cmake-module ];
  propagatedNativeBuildInputs = [ ros-environment rpyutils ];
  propagatedBuildInputs = [ event-camera-codecs event-camera-msgs pybind11-vendor ];
  checkInputs = [ ament-cmake-clang-format ament-cmake-pytest ament-lint-auto ament-lint-common rclpy rosbag2-py rosbag2-storage-default-plugins rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "event_camera_py" = substituteSource {
        src = fetchgit {
          name = "event_camera_py-source";
          url = "https://github.com/ros2-gbp/event_camera_py-release.git";
          rev = "c24a962f62635b52f9c51cdb33b2cbb1feee5daa";
          hash = "sha256-uthadX9Wphw+c1YYKt/PywG59JLnXNya4kfxTW+VVyY=";
        };
      };
    });
  };
  meta = {
    description = "Python access for event_camera_msgs.";
  };
})
