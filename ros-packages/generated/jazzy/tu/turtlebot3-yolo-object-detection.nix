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
  version = "1.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_yolo_object_detection";
  propagatedNativeBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  propagatedBuildInputs = [ compressed-image-transport cv-bridge image-transport rclpy sensor-msgs std-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_yolo_object_detection" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_yolo_object_detection-source";
        url = "https://github.com/ros2-gbp/turtlebot3_applications-release.git";
        rev = "094d0e09d7cd161b30dafa33b3a201221106067b";
        hash = "sha256-GcQEt+ToBVvYc6LUu2pUH0XR9AArwiK8TJNOLruFFRw=";
      };
    };
  });
  meta = {
    description = "\n    YOLO-based object detection for TurtleBot3\n  ";
  };
})
