{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosbag2_py,
  rosbag2_storage_default_plugins,
  rosbag2_test_common,
  substituteSource,
}:
let
  sources = rec {
    ros2bag = substituteSource {
      src = fetchgit {
        name = "ros2bag-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "aa7ee458f542cd6922b9deb133cb0ee27b01c8d9";
        hash = "sha256-ramrorpx0B7OQ4ZzZupIQPdkq9jcL+gdyEnJX4QACUw=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2bag";
  version = "0.29.0-1";
  src = sources.ros2bag;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python rclpy ros2cli rosbag2_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch_testing launch_testing_ros python3Packages.pytest rosbag2_storage_default_plugins rosbag2_test_common ];
  missingDependencies = [  ];
  meta = {
    description = "Entry point for rosbag in ROS 2";
  };
}
