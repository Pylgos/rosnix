{
  buildAmentPythonPackage,
  compressed-image-transport,
  cv-bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image-transport,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_yolo_object_detection";
  version = "1.3.3-1";
  src = finalAttrs.passthru.sources."turtlebot3_yolo_object_detection";
  propagatedNativeBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_yolo_object_detection" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_yolo_object_detection-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "427db8f30746cbd40be0bc1baa49c067332e1da4";
        hash = "sha256-LyLcXx3HdRs6q9ocvbhqo1URQGUMHCKQcJJmQYmEFlY=";
      };
    };
  });
  meta = {
    description = "\n    YOLO-based object detection for TurtleBot3\n  ";
  };
})
