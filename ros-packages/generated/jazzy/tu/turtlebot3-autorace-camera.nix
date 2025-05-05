{
  buildAmentPythonPackage,
  cv-bridge,
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
  pname = "turtlebot3_autorace_camera";
  version = "1.2.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_autorace_camera";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ cv-bridge sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_autorace_camera" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_autorace_camera-source";
        url = "https://github.com/ros2-gbp/turtlebot3_autorace-release.git";
        rev = "c86ce05df697f274c9b391e6ab394a3c3fa9305a";
        hash = "sha256-N5p7FhANDnCdU70wlEa22zjyo8hKCDhNy9KC5QI6A+s=";
      };
    };
  });
  meta = {
    description = "ROS 2 packages for camera calibration and image processing in TurtleBot AutoRace";
  };
})
