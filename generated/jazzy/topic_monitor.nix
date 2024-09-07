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
        rev = "33f1dde29a4a146bde0270c8bc347b4c67c0927b";
        hash = "sha256-t0E1z5SMZD+Ik7csZ+S4pk9+8qvyZdw5J9IW3uGSEAY=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_monitor";
  version = "0.33.5-1";
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
