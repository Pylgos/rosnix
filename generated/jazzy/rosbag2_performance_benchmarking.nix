{
  ament_cmake,
  ament_index_python,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  python3Packages,
  rclcpp,
  rmw,
  ros2bag,
  ros2launch,
  ros_testing,
  rosbag2_compression,
  rosbag2_cpp,
  rosbag2_performance_benchmarking_msgs,
  rosbag2_py,
  rosbag2_storage,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  sensor_msgs,
  substituteSource,
  yaml_cpp_vendor,
}:
let
  sources = rec {
    rosbag2_performance_benchmarking = substituteSource {
      src = fetchgit {
        name = "rosbag2_performance_benchmarking-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "e9119ad170ca65b399410eec68fed21e5e50720f";
        hash = "sha256-hzDDbAW9ix/OYN+Ssuz11IrcQnrFMbOJlQRv2QoXi9s=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "rosbag2_performance_benchmarking";
  version = "0.26.4-1";
  src = sources.rosbag2_performance_benchmarking;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python launch launch_ros python3Packages.psutil rclcpp rmw rosbag2_compression rosbag2_cpp rosbag2_performance_benchmarking_msgs rosbag2_py rosbag2_storage sensor_msgs yaml_cpp_vendor ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common launch_ros ros2bag ros2launch ros_testing rosbag2_storage_default_plugins rosbag2_test_common ];
  missingDependencies = [  ];
  meta = {
    description = "Code to benchmark rosbag2";
  };
}
