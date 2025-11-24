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
  version = "2.3.4-1";
  src = finalAttrs.passthru.sources."turtlebot3_example";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_example" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_example-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "6d1cfa097e2c01abbc389e559a9923d4cc0c294c";
        hash = "sha256-zYem5JyC5zWTaXI+hqnpM3QF0EeM0WTCOgRCybOvY40=";
      };
    };
  });
  meta = {
    description = "\n    This package provides four basic examples for TurtleBot3 (i.e., interactive marker, object detection, patrol and position control).\n  ";
  };
})
