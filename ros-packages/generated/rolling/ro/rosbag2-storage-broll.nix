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
  version = "0.1.0-1";
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
        rev = "f2c0e1d7a99bae163e64f7b84c075f351806ae12";
        hash = "sha256-V8ciDKS5zMkY3Iw5PlVODLKTl5ZK3hFsZOOtUHCVjWM=";
      };
    };
  });
  meta = {
    description = "Rosbag2 storage plugin to play audio/video files as ROS messages using B-Roll tools";
  };
})
