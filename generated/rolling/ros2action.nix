{
  action_msgs,
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rclpy,
  ros2cli,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2action = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "9438bf45f3208dffee15a8c9bbe85bd9a868865e";
        hash = "sha256-zN5Lbd/k8wtr7GXXi2EcuAfMqAF8Dl/hWSN9dElZtlc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2action";
  version = "0.34.1-1";
  src = sources.ros2action;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ action_msgs ament_index_python rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The action command for ROS 2 command line tools.";
  };
}
