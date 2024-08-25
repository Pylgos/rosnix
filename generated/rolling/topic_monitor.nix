{
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  python3Packages,
  rclpy,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_monitor = substituteSource {
      src = fetchgit {
        name = "topic_monitor-source";
        url = "https://github.com/ros2-gbp/demos-release.git";
        rev = "576d1520af7b70aff3ad30e78d323083cb2f5f7e";
        hash = "sha256-tGXgguRxqMKS5aIn3bMykyCWBL0XCW+nh0hFq2WK7So=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_monitor";
  version = "0.34.2-1";
  src = sources.topic_monitor;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ launch launch_ros rclpy std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_flake8 ament_pep257 python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
}
