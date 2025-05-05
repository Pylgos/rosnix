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
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot4_gz_bringup";
  version = "2.0.2-1";
  src = finalAttrs.passthru.sources."turtlebot4_gz_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-gz-bringup irobot-create-gz-plugins irobot-create-gz-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-gz-interfaces ros-gz-sim std-msgs turtlebot4-description turtlebot4-gz-gui-plugins turtlebot4-gz-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ geometry-msgs irobot-create-common-bringup irobot-create-description irobot-create-gz-bringup irobot-create-gz-plugins irobot-create-gz-toolbox irobot-create-msgs irobot-create-nodes irobot-create-toolbox ros-gz-interfaces ros-gz-sim std-msgs turtlebot4-description turtlebot4-gz-gui-plugins turtlebot4-gz-toolbox turtlebot4-msgs turtlebot4-navigation turtlebot4-node turtlebot4-viz ];
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot4_gz_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot4_gz_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot4_simulator-release.git";
        rev = "0f4e5149c34da6d2592c54ffa5823c246d5f1f87";
        hash = "sha256-SJRTOWdEUsRtPSj76DZ6PpkFrlmbwavtp1SoP6hRBMQ=";
      };
    };
  });
  meta = {
    description = "TurtleBot 4 Gazebo Simulator bringup";
  };
})
