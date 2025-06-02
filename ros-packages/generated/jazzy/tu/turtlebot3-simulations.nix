{
  ament-cmake,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  turtlebot3-fake-node,
  turtlebot3-gazebo,
  wrapRosQtAppsHook,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_simulations";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_simulations";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedNativeBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo ];
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_simulations" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "e5a9282bbfc971554b4abcae1c421e5ec1bd3f79";
        hash = "sha256-r9NoRwUH6BpWbrnCNjybqI8ujM8toYg0YsB5SLSQgUg=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for TurtleBot3 simulations\n  ";
  };
})
