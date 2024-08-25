{
  ament_copyright,
  ament_flake8,
  ament_index_python,
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
  ros_environment,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ros2doctor = substituteSource {
      src = fetchgit {
        name = "ros2doctor-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "de0f2b78fac592f82ef568a19fdb0bf63a19b92d";
        hash = "sha256-JXBAZbli5oJOfIgCmMgvtoe2omh/HSe5ghJP6JBBxms=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2doctor";
  version = "0.32.1-1";
  src = sources.ros2doctor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.catkin-pkg buildPackages.python3Packages.importlib-metadata ros_environment ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python python3Packages.psutil python3Packages.rosdistro rclpy ros2cli std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout std_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "A command line tool to check potential issues in a ROS 2 system";
  };
}
