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
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_teleop";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy ];
  propagatedBuildInputs = [ geometry-msgs rclpy ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_teleop" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_teleop-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "946bed07a470ed097283d9a693f8982af02eceed";
        hash = "sha256-mVGZomFEUJkyTW5P4nsqCDhmfEFKn86MDtbuEHd4SeA=";
      };
    };
  });
  meta = {
    description = "\n    Teleoperation node using keyboard for TurtleBot3.\n  ";
  };
})
