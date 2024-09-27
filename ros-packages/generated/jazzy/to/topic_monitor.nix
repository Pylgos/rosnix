{
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch_ros,
  rclpy,
  rosSystemPackages,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    topic_monitor-33f1dde29a4a146bde0270c8bc347b4c67c0927b = substituteSource {
      src = fetchgit {
        name = "topic_monitor-33f1dde29a4a146bde0270c8bc347b4c67c0927b-source";
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
  src = sources.topic_monitor-33f1dde29a4a146bde0270c8bc347b4c67c0927b;
  nativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ launch launch_ros rclpy std_msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_flake8 ament_pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  meta = {
    description = "Package containing tools for monitoring ROS 2 topics.";
  };
}
