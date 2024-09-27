{
  ament_cmake,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosSystemPackages,
  substituteSource,
  turtlebot3_fake_node,
  turtlebot3_gazebo,
}:
let
  sources = rec {
    turtlebot3_simulations-111af0a35692265f89f85e85fcf66e1d79278a1a = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-111af0a35692265f89f85e85fcf66e1d79278a1a-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "111af0a35692265f89f85e85fcf66e1d79278a1a";
        hash = "sha256-W+h1Fb5Y9PXr/M12d+YOfwxWR1QaArnZtIDmkpQ95xI=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "turtlebot3_simulations";
  version = "2.2.5-5";
  src = sources.turtlebot3_simulations-111af0a35692265f89f85e85fcf66e1d79278a1a;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ turtlebot3_fake_node turtlebot3_gazebo ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "ROS 2 packages for TurtleBot3 simulations";
  };
}
