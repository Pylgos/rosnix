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
  pname = "turtlebot3_autorace_detect";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_autorace_detect";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_autorace_detect" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_autorace_detect-source";
        url = "https://github.com/ros2-gbp/turtlebot3_autorace-release.git";
        rev = "d1e31073890f9488c0070d4529cdd0ecacf270c6";
        hash = "sha256-A+Jv+mcCn+5grqCRPBa39lMvJolEA8I8fWx8BuGXmFI=";
      };
    };
  });
  meta = {
    description = "ROS 2 packages for turtlebot3_autorace_detect";
  };
})
