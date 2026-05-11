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
  version = "0.34.0-1";
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
        rev = "7208b24af3fa2e14dbd35fa036f350b217165982";
        hash = "sha256-8HLyuuHyS6FGjhaQlEwbM47jbrkRNH/JFEYqwqUFkAY=";
      };
    };
  });
  meta = {
    description = "Code to benchmark rosbag2";
  };
})
