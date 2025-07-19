{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  hls-lfcd-lds-driver,
  mkSourceSet,
  robot-state-publisher,
  rosSystemPackages,
  rviz2,
  substituteSource,
  turtlebot3-description,
  turtlebot3-node,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_bringup";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_bringup";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ hls-lfcd-lds-driver robot-state-publisher rviz2 turtlebot3-description turtlebot3-node ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ hls-lfcd-lds-driver robot-state-publisher rviz2 turtlebot3-description turtlebot3-node ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_bringup" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_bringup-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "dfcd2a26f4eeced96fc5b4c686599756e07e9a14";
        hash = "sha256-k5PSS0DevzNW2O0WBjK+Xdg6LqMjB1pNLAEn4Blmlr8=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for starting the TurtleBot3\n  ";
  };
})
