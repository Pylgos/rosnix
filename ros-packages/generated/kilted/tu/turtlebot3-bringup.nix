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
  version = "2.3.6-1";
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
        rev = "15a34537ccf837528bf99b3c50ea14e0df2b25ba";
        hash = "sha256-RtNj7sRB1eAlXVMG8hhhXlOufIFIs2ORvcFNmX1ozpw=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 launch scripts for starting the TurtleBot3\n  ";
  };
})
