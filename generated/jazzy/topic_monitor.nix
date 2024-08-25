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
        rev = "af7208b4e17f17d95c61c6f91c91bf40a0da736b";
        hash = "sha256-GA57MYOZOEO3eCVy4eN3N65yCJ/KynuE2zh2EYSctqg=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "topic_monitor";
  version = "0.33.4-1";
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
