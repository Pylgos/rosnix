{
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
  ros2cli,
  ros2cli_test_interfaces,
  rosidl_adapter,
  rosidl_runtime_py,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2interface = substituteSource {
      src = fetchgit {
        name = "ros2interface-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "2fc4821d3d5b0e0d1effbb7dd5533b5bde2b33e1";
        hash = "sha256-Amr7KhVrHZ1RxrrcLH3gqZmMqGBE5P+uqTIiAkfOSis=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.32.1-1";
  src = sources.ros2interface;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ rosidl_adapter ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python ros2cli rosidl_runtime_py ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout ros2cli_test_interfaces test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The interface command for ROS 2 command line tools";
  };
}
