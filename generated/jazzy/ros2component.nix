{
  ament_copyright,
  ament_flake8,
  ament_index_python,
  ament_pep257,
  ament_xmllint,
  buildRosPackage,
  composition_interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rcl_interfaces,
  rclcpp_components,
  rclpy,
  ros2cli,
  ros2node,
  ros2param,
  ros2pkg,
  substituteSource,
}:
let
  sources = rec {
    ros2component = substituteSource {
      src = fetchgit {
        name = "ros2component-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4d0984d4989f109d9cd7e15951c6ac1ce6ac8378";
        hash = "sha256-KvDKQqXD6vv76CVNmmcBHWb8l0ktorsRYkGo51se1CE=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2component";
  version = "0.32.1-1";
  src = sources.ros2component;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ ament_index_python composition_interfaces rcl_interfaces rclcpp_components rclpy ros2cli ros2node ros2param ros2pkg ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest python3Packages.pytest-timeout ];
  missingDependencies = [  ];
  meta = {
    description = "The component command for ROS 2 command line tools.";
  };
}
