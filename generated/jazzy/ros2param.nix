{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  python3Packages,
  rcl_interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  substituteSource,
}:
let
  sources = rec {
    ros2param = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "ee8dd6eb93f0f338a6cbb016e7badabee6c7e64f";
        hash = "sha256-XSOpnY0a2+4OjpeKOrPY5J9WItW0sAZ2VGeByFpd4N0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.32.1-1";
  src = sources.ros2param;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rcl_interfaces rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout ];
  missingDependencies = [  ];
  meta = {
    description = "The param command for ROS 2 command line tools.";
  };
}
