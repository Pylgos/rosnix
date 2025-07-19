{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  broll,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rosSystemPackages,
  rosbag2-cpp,
  rosbag2-storage,
  rosbag2-transport,
  sensor-msgs,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage_broll";
  version = "0.1.1-1";
  src = finalAttrs.passthru.sources."rosbag2_storage_broll";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ broll pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-transport sensor-msgs ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ broll pluginlib rclcpp rosbag2-cpp rosbag2-storage rosbag2-transport sensor-msgs ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage_broll" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage_broll-source";
        url = "https://github.com/ros2-gbp/rosbag2_broll-release.git";
        rev = "7226ebd50953469952e31f7f424d82f6971f47b0";
        hash = "sha256-6l1TpMSHTEKxcLKtz0tzAQHUip8k150Uw0eOPtK8CCs=";
      };
    };
  });
  meta = {
    description = "Rosbag2 storage plugin to play audio/video files as ROS messages using B-Roll tools";
  };
})
