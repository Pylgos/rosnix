{
  ament-cmake,
  ament-cmake-gmock,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  pluginlib,
  rclcpp,
  rcutils,
  rmw,
  rosSystemPackages,
  rosbag2-test-common,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_storage";
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_storage";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ pluginlib rclcpp rcutils rmw yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-cmake-gtest ament-lint-auto ament-lint-common rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_storage" = substituteSource {
      src = fetchgit {
        name = "rosbag2_storage-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "8951dc8fa500b13b5f83475c3298bc9b82c20651";
        hash = "sha256-9KP5gzgF4czDEHqIp/gDOeXBJxmKOPBIXL6n1PLVdBM=";
      };
    };
  });
  meta = {
    description = "ROS2 independent storage format to store serialized ROS2 messages";
  };
})
