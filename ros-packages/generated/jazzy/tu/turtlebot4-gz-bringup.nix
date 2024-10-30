{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  irobot-create-common-bringup,
  irobot-create-description,
  irobot-create-gz-bringup,
  irobot-create-gz-plugins,
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
        rev = "0f4e5149c34da6d2592c54ffa5823c246d5f1f87";
        hash = "sha256-SJRTOWdEUsRtPSj76DZ6PpkFrlmbwavtp1SoP6hRBMQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_gz_bringup";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-gz-bringup irobot-create-gz-plugins irobot-create-gz-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-gz-interfaces ros-gz-sim std-msgs turtlebot4-description turtlebot4-gz-gui-plugins turtlebot4-gz-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  passthru = {
    inherit sources;
  };
  meta = {
    description = "TurtleBot 4 Gazebo Simulator bringup";
  };
})
