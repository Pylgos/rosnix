{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry_msgs,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosgraph_msgs,
  rosidl_runtime_py,
  std_msgs,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2topic = substituteSource {
      src = fetchgit {
        name = "ros2topic-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "f95e34ae173e6bc94e70e3aa8cc63bfd99d4e216";
        hash = "sha256-i2HNgtWFUYxZ0nKYGTzkLR7khK1Hnzp5nPQMtt4yWWc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2topic";
  version = "0.32.1-1";
  src = sources.ros2topic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.numpy buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint geometry_msgs launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout rosgraph_msgs std_msgs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The topic command for ROS 2 command line tools.";
  };
}
