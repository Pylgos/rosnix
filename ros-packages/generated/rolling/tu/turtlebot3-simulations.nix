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
  version = "2.3.7-1";
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
        rev = "512a9157f44620577f17404395c34fc2298c48aa";
        hash = "sha256-Xj/KXrR5D6nMQAcc7Pb/C8gArxS6rjaEHvuhM4IRomE=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for TurtleBot3 simulations\n  ";
  };
})
