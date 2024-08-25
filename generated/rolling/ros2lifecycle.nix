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
  lifecycle_msgs,
  python3Packages,
  rclpy,
  ros2cli,
  ros2lifecycle_test_fixtures,
  ros2node,
  ros2service,
  substituteSource,
}:
let
  sources = rec {
    ros2lifecycle = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "72ec9d6a9f5348f85d31a0c00ab809855d5239a2";
        hash = "sha256-0ZkoDfawGefMnVd0PTPGeIOxRkc1z9P+YpXixrOws1g=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2lifecycle";
  version = "0.34.1-1";
  src = sources.ros2lifecycle;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ lifecycle_msgs rclpy ros2cli ros2node ros2service ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout ros2lifecycle_test_fixtures ];
  missingDependencies = [  ];
  meta = {
    description = "The lifecycle command for ROS 2 command line tools.";
  };
}
