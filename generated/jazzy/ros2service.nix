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
  launch,
  launch_ros,
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
    ros2service = substituteSource {
      src = fetchgit {
        name = "ros2service-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "14aa2bef1b8f15296b3e17a3252747dbde689211";
        hash = "sha256-YzPP2VRyQyjcJxEV0UyOaGs5+Ls5UkeykNwdu92GAh0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2service";
  version = "0.32.1-1";
  src = sources.ros2service;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pyyaml ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The service command for ROS 2 command line tools.";
  };
}
