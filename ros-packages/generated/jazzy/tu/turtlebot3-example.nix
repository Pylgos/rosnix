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
  version = "2.2.9-1";
  src = finalAttrs.passthru.sources."turtlebot3_example";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_example" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_example-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "4519a4596083090288b2c916050967a7ad3988b9";
        hash = "sha256-YS0OD6q5/5eCzHPPJVUut4NKxk/xPXzRv05kwf28nw8=";
      };
    };
  });
  meta = {
    description = "This package provides four basic examples for TurtleBot3 (i.e., interactive marker, object detection, patrol and position control).";
  };
})
