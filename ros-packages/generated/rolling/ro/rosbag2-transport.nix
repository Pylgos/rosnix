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
  rclcpp-action,
  rclcpp-components,
  rcpputils,
  rcutils,
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
  substituteSource,
  test-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_transport";
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_transport";
  nativeBuildInputs = [ ament-cmake-ros ];
  propagatedNativeBuildInputs = [ keyboard-handler rclcpp rclcpp-action rclcpp-components rcpputils rcutils rmw rosbag2-compression rosbag2-cpp rosbag2-interfaces rosbag2-storage ];
  buildInputs = [ ament-cmake-ros ];
  propagatedBuildInputs = [ keyboard-handler rclcpp rclcpp-action rclcpp-components rcpputils rcutils rmw rosbag2-compression rosbag2-cpp rosbag2-interfaces rosbag2-storage ];
  checkInputs = [ ament-cmake-gmock ament-index-cpp ament-lint-auto ament-lint-common composition-interfaces rmw-implementation-cmake rosbag2-compression-zstd rosbag2-storage-default-plugins rosbag2-test-common test-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_transport" = substituteSource {
      src = fetchgit {
        name = "rosbag2_transport-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "0d56c9693aba56ac46f7de4985b98a47cbf0e1b0";
        hash = "sha256-alGnfXsgrt6uKPfWglZxBCEmVCr85UPYM92zwYJxZgw=";
      };
    };
  });
  meta = {
    description = "Layer encapsulating ROS middleware to allow rosbag2 to be used with or without middleware";
  };
})
