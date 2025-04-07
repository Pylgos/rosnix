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
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_simulations";
  nativeBuildInputs = [ ament-cmake wrapRosQtAppsHook ];
  propagatedBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_simulations" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_simulations-source";
        url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
        rev = "fe92f670719c8c897457ec57bf631bca8f6139fc";
        hash = "sha256-j4M3ybTSnOOZgqwbY11InVil3rXWmWDBrpjY6jmDnnc=";
      };
    };
  });
  meta = {
    description = "ROS 2 packages for TurtleBot3 simulations";
  };
})
