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
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_aruco_tracker";
  propagatedNativeBuildInputs = [ cv-bridge geometry-msgs rclpy sensor-msgs tf2-ros ];
  propagatedBuildInputs = [ cv-bridge geometry-msgs rclpy sensor-msgs tf2-ros ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_aruco_tracker" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_aruco_tracker-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "8968b77b7415d424ea312af78b49d37b7f4abe0f";
        hash = "sha256-wWxmZvqQN5UBkudclXcH2pmg4FzEd35B4WRb5En0Tds=";
      };
    };
  });
  meta = {
    description = "\n    ArUco Tracker for TurtleBot3 Examples.\n  ";
  };
})
