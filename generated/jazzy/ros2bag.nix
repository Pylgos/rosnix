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
        rev = "888b279d8d0d4d76a9125d0b4328df70f387bf59";
        hash = "sha256-wfOK7yr2giKKP3nGzfbQn9WUZNNwoJ+NaZthXDKXg/k=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2bag";
  version = "0.26.4-1";
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
