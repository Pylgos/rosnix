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
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "turtlebot3_simulations";
  version = "2.2.5-4";
  src = finalAttrs.passthru.sources."turtlebot3_simulations";
  nativeBuildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ turtlebot3-fake-node turtlebot3-gazebo ];
  passthru = {
    sources = mkSourceSet (sources: {
      "turtlebot3_simulations" = substituteSource {
        src = fetchgit {
          name = "turtlebot3_simulations-source";
          url = "https://github.com/ros2-gbp/turtlebot3_simulations-release.git";
          rev = "f5f2d3dcf497a22861701c4115a62bd29576a1bd";
          hash = "sha256-W+h1Fb5Y9PXr/M12d+YOfwxWR1QaArnZtIDmkpQ95xI=";
        };
      };
    });
  };
  meta = {
    description = "ROS 2 packages for TurtleBot3 simulations";
  };
})
