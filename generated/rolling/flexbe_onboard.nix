{
  ament_copyright,
  ament_flake8,
  ament_pep257,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  flexbe_core,
  flexbe_msgs,
  flexbe_states,
  launch_ros,
  launch_testing,
  python3Packages,
  rclpy,
  substituteSource,
}:
let
  sources = rec {
    flexbe_onboard = substituteSource {
      src = fetchgit {
        name = "flexbe_onboard-source";
        url = "https://github.com/ros2-gbp/flexbe_behavior_engine-release.git";
        rev = "c7da50d27cb4e95958c27128d2cc2d8f140cc73c";
        hash = "sha256-EbO7yBYjwzsyok21wnRFK+vFSQE/2Pf3K63lSfzHNSk=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "flexbe_onboard";
  version = "3.0.3-1";
  src = sources.flexbe_onboard;
  nativeBuildInputs = [  ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ flexbe_core flexbe_msgs flexbe_states launch_ros rclpy ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_copyright ament_flake8 ament_pep257 launch_testing python3Packages.pytest ];
  missingDependencies = [  ];
  meta = {
    description = "flexbe_onboard implements the robot-side of the behavior engine from where all behaviors are started.";
  };
}
