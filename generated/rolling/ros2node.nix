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
  rclpy,
  ros2cli,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2node = substituteSource {
      src = fetchgit {
        name = "ros2node-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "f0e9aa2108c225140121d80f3679e87569156d59";
        hash = "sha256-Qe5QPGSUYtkg1l2R8V0oen9m8BP97iXaZqvdB3rn5Zs=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2node";
  version = "0.34.1-1";
  src = sources.ros2node;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rclpy ros2cli ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint launch launch_ros launch_testing launch_testing_ros python3Packages.pytest python3Packages.pytest-timeout rclpy test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "The node command for ROS 2 command line tools.";
  };
}
