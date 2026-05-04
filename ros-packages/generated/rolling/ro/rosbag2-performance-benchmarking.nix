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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_performance_benchmarking";
  version = "0.33.1-2";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ ament-index-python launch launch-ros rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-performance-benchmarking-msgs rosbag2-py rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-psutil" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ ament-index-python launch launch-ros rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-performance-benchmarking-msgs rosbag2-py rosbag2-storage sensor-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros ros2bag ros2launch ros-testing rosbag2-storage-default-plugins rosbag2-test-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ae7a25156ec5a782b755001be87db3f2a6200260";
        hash = "sha256-Lk4mgEDkbo/0wX+ykroG1gF9XVFiODfy7u7MgaIalsU=";
      };
    };
  });
  meta = {
    description = "Code to benchmark rosbag2";
  };
})
