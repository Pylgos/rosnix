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
  version = "1.2.2-2";
  src = finalAttrs.passthru.sources."turtlebot3_autorace_camera";
  propagatedNativeBuildInputs = [ cv-bridge rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ cv-bridge rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_autorace_camera" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_autorace_camera-source";
        url = "https://github.com/ros2-gbp/turtlebot3_autorace-release.git";
        rev = "ffbbc75b42f57074970a50b3b49ce5031c7ce3f9";
        hash = "sha256-N5p7FhANDnCdU70wlEa22zjyo8hKCDhNy9KC5QI6A+s=";
      };
    };
  });
  meta = {
    description = "\n    ROS 2 packages for camera calibration and image processing in TurtleBot AutoRace\n  ";
  };
})
