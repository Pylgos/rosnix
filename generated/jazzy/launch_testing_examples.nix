{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildPackages,
  buildRosPackage,
  demo_nodes_cpp,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  launch_testing,
  launch_testing_ros,
  rcl_interfaces,
  rclpy,
  ros2bag,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    launch_testing_examples = substituteSource {
      src = fetchgit {
        name = "launch_testing_examples-source";
        url = "https://github.com/ros2-gbp/examples-release.git";
        rev = "c2236ee11ef8f07bccd6904e0db1d6579fd030d4";
        hash = "sha256-AnGtfmc/Fo5R0zEcot5yB6C+xgFOA31yvAnV9fQRBK0=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.19.4-1";
  src = sources.launch_testing_examples;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.pytest ];
  buildInputs = [  ];
  propagatedBuildInputs = [ demo_nodes_cpp launch launch_ros launch_testing launch_testing_ros rcl_interfaces rclpy ros2bag std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ];
  missingDependencies = [  ];
  meta = {
    description = "Examples of simple launch tests";
  };
}
