{
  buildAmentPythonPackage,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_aruco_tracker";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_aruco_tracker";
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs rclpy sensor-msgs tf2-ros ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs rclpy sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_aruco_tracker" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_aruco_tracker-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "9788ac74b150088564531581738cc049a52b7c6a";
        hash = "sha256-KxnHC49E41p+CGI+5hZE/s8JB6APDVtIkH7hIALW2dw=";
      };
    };
  });
  meta = {
    description = "\n    ArUco Tracker for TurtleBot3 Examples.\n  ";
  };
})
