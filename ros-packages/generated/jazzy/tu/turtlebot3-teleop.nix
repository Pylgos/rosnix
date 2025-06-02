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
  version = "2.3.1-1";
  src = finalAttrs.passthru.sources."turtlebot3_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_teleop" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "2c0d5a821c346eabd2f7dc97bc031bcb905db61e";
        hash = "sha256-6YNrljPbV9RyUkbWue+jtMABj2mevEixxsuZIv6DFgY=";
      };
    };
  });
  meta = {
    description = "\n    Teleoperation node using keyboard for TurtleBot3.\n  ";
  };
})
