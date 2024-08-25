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
        rev = "3e8a7ef2065c1a1e21e5555e47eb4173e953c934";
        hash = "sha256-9W3jDKzG+3FeN34+2KE7hBQpqnR6MvwlvJujDtVlAkY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2service";
  version = "0.34.1-1";
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
