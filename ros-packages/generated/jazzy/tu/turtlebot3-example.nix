{
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  nav-msgs,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf-transformations,
  turtlebot3-msgs,
  visualization-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtlebot3_example";
  version = "2.3.2-1";
  src = finalAttrs.passthru.sources."turtlebot3_example";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_example" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_example-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "a9a566a8d9bb2620c09055a9c3c655b6bd5d1516";
        hash = "sha256-DiK8eiFzp/FI4TssV/smJltwEZZk95lXIYwv1M96ZQE=";
      };
    };
  });
  meta = {
    description = "\n    This package provides four basic examples for TurtleBot3 (i.e., interactive marker, object detection, patrol and position control).\n  ";
  };
})
