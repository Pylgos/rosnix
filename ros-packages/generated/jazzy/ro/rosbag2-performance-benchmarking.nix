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
let
  sources = mkSourceSet (sources: {
    "rosbag2_performance_benchmarking" = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "fc8676f48d2e57fceb324fe441bff52fd21fee4b";
        hash = "sha256-u8bWNK7XluxA3fHYJzqNKXaqACf19T0cPc6Dmf0ioZc=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "rosbag2_performance_benchmarking";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_performance_benchmarking";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python launch launch-ros rclcpp rmw rosbag2-compression rosbag2-cpp rosbag2-performance-benchmarking-msgs rosbag2-py rosbag2-storage sensor-msgs yaml-cpp-vendor ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-psutil" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common launch-ros ros2bag ros2launch ros-testing rosbag2-storage-default-plugins rosbag2-test-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "Code to benchmark rosbag2";
  };
})
