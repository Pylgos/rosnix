{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-gz-bringup,
  irobot-create-gz-toolbox,
  irobot-create-msgs,
  irobot-create-nodes,
  irobot-create-toolbox,
  mkSourceSet,
  ros-gz-interfaces,
  ros-gz-sim,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  turtlebot4-description,
  turtlebot4-gz-gui-plugins,
  turtlebot4-gz-toolbox,
  turtlebot4-msgs,
  turtlebot4-navigation,
  turtlebot4-node,
  turtlebot4-viz,
  wrapRosQtAppsHook,
}:
let
  sources = mkSourceSet (sources: {
    "turtlebot4_gz_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "ac19bf9bf475c12170ca7b01ab7c3939e298042e";
        hash = "sha256-k3vXzAg0WVo5WbwkUj/84aih5y9BibGw6gZ0CS8w7lc=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "turtlebot4-gz-bringup";
  version = "2.0.1-1";
  src = sources."turtlebot4_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-gz-bringup irobot-create-gz-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-gz-interfaces ros-gz-sim std-msgs turtlebot4-description turtlebot4-gz-gui-plugins turtlebot4-gz-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "TurtleBot 4 Gazebo Simulator bringup";
  };
}
