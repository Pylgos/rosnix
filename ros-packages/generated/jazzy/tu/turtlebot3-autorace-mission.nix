{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_autorace_mission";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_autorace_mission";
  propagatedNativeBuildInputs = [ rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_autorace_mission" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_autorace_mission-source";
        url = "https://github.com/ros2-gbp/turtlebot3_autorace-release.git";
        rev = "316fa48dab036b108401408b00609a04ec21b4e7";
        hash = "sha256-8OcT9eBNVWMJfIGV+rsoHOZcekaJWHWDVagscHF23pQ=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for turtlebot3_autorace_mission\n  ";
  };
})
