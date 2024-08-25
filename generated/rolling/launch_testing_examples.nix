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
        rev = "e108dbcd077d21661317d3f2aec1bbc1ce82719f";
        hash = "sha256-Kw/HBLjTaLj+zjxaMJ/3mItcr9/VgqQIp0U7ibvwrck=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "launch_testing_examples";
  version = "0.20.2-1";
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
