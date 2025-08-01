{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_teleop";
  version = "2.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_teleop" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "424ff17a0e08eff838e16238c8d191431997df43";
        hash = "sha256-7MuhpdwmDPVt3DSd1TLMNN3JBuEFIpUZa1uGc5/3vO8=";
      };
    };
  });
  meta = {
    description = "\n    Teleoperation node using keyboard for TurtleBot3.\n  ";
  };
})
