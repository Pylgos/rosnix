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
        rev = "19eb05116f36443a8396099d3055c761393c472f";
        hash = "sha256-ZEM7PvTOiXF1b8TozI1nkGImCrNW57lDt304Fa1n0yE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2topic";
  version = "0.34.1-1";
  src = sources.ros2topic;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.numpy rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint geometry_msgs launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout rosgraph_msgs std_msgs test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The topic command for ROS 2 command line tools.";
  };
}
