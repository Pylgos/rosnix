{
  ament-cmake-gmock,
  ament-cmake-ros,
  ament-index-cpp,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  composition-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  keyboard-handler,
  mkSourceSet,
  rclcpp,
  rclcpp-components,
  rmw,
  rmw-implementation-cmake,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-compression-zstd,
  rosbag2-cpp,
  rosbag2-interfaces,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  shared-queues-vendor,
  substituteSource,
  test-msgs,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_transport";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ keyboard-handler rclcpp rclcpp-components rmw rosbag2-compression rosbag2-cpp rosbag2-interfaces rosbag2-storage shared-queues-vendor yaml-cpp-vendor ];
  checkInputs = [ ament-cmake-gmock ament-index-cpp ament-lint-auto ament-lint-common composition-interfaces rmw-implementation-cmake rosbag2-compression-zstd rosbag2-storage-default-plugins rosbag2-test-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_transport" = substituteSource {
      src = fetchgit {
        name = "rosbag2_transport-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "83001dc20168e19aa650cff7246e33c18653c4b4";
        hash = "sha256-Csq89oz1XhJxkLlcaoLHg5EjK7roJN75M3iU/zyp78E=";
      };
    };
  });
  meta = {
    description = "Layer encapsulating ROS middleware to allow rosbag2 to be used with or without middleware";
  };
})
