{
  ament-cmake,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  mkSourceSet,
  rclcpp,
  rmw,
  ros-testing,
  ros2bag,
  ros2launch,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-cpp,
  rosbag2-performance-benchmarking-msgs,
  rosbag2-py,
  rosbag2-storage,
  rosbag2-storage-default-plugins,
  rosbag2-test-common,
  sensor-msgs,
  substituteSource,
  yaml-cpp-vendor,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_performance_benchmarking";
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros rmw rosbag2-compression rosbag2-cpp rosbag2-performance-benchmarking-msgs rosbag2-py rosbag2-storage sensor-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros ros2bag ros2launch ros-testing rosbag2-storage-default-plugins rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "b509c6df2f07738b8c7b34b3cf8bafee93322355";
        hash = "sha256-BEZ6HVT1mZ/KkpIPOztv3XcdyttQzn7S6O3lrVTYA84=";
      };
    };
  });
  meta = {
    description = "Code to benchmark rosbag2";
  };
})
