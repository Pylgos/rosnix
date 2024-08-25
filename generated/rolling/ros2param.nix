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
        rev = "a98c2a5c83e1364660a625aef68dff1979c534b2";
        hash = "sha256-zOQUR6gwAev32UdMK+efB6uZKzTyJ2811oI6Jcag6Zk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2param";
  version = "0.34.1-1";
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
