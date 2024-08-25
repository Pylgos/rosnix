{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  substituteSource,
  turtlebot3_fake_node,
  turtlebot3_gazebo,
}:
let
  sources = rec {
    turtlebot3_simulations = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "f5f2d3dcf497a22861701c4115a62bd29576a1bd";
        hash = "sha256-W+h1Fb5Y9PXr/M12d+YOfwxWR1QaArnZtIDmkpQ95xI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_simulations";
  version = "2.2.5-4";
  src = sources.turtlebot3_simulations;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [  ];
  buildInputs = [  ];
  propagatedBuildInputs = [ turtlebot3_fake_node turtlebot3_gazebo ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [  ];
  missingDependencies = [  ];
  meta = {
    description = "ROS 2 packages for TurtleBot3 simulations";
  };
}
