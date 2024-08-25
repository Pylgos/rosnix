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
        rev = "b8319e4b3dd8275880f1a74b2b933b7c5783d6a1";
        hash = "sha256-FUMbEzGQ11o31eAjj07WHAX1QPfrSL0q+5yBscImv08=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2interface";
  version = "0.34.1-1";
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
