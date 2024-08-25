{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  ament_xmllint,
  buildPackages,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  python3Packages,
  rclpy,
  substituteSource,
  test_msgs,
}:
let
  sources = rec {
    ros2cli = substituteSource {
      src = fetchgit {
        name = "ros2cli-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "7b822ccef565a9d5a3d7f75815c16c781611592d";
        hash = "sha256-LpwlTyOQWsoWVEoxdPppPmPztdEB7oAx7QjmG9bU2/Y=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ros2cli";
  version = "0.32.1-1";
  src = sources.ros2cli;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [ buildPackages.python3Packages.argcomplete buildPackages.python3Packages.importlib-metadata ];
  buildInputs = [  ];
  propagatedBuildInputs = [ python3Packages.packaging python3Packages.psutil python3Packages.setuptools rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 ament_xmllint python3Packages.pytest python3Packages.pytest-timeout test_msgs ];
  missingDependencies = [  ];
  meta = {
    description = "Framework for ROS 2 command line tools.";
  };
}
