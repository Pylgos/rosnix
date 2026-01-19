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
  version = "2.3.6-1";
  src = finalAttrs.passthru.sources."turtlebot3_example";
  propagatedNativeBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  propagatedBuildInputs = [ geometry-msgs nav-msgs rclpy sensor-msgs tf-transformations turtlebot3-msgs visualization-msgs ];
  passthru.sources = mkSourceSet (sources: {
    "turtlebot3_example" = substituteSource {
      src = fetchgit {
        name = "turtlebot3_example-source";
        url = "https://github.com/ros2-gbp/turtlebot3-release.git";
        rev = "0bcd98c07a56171764c6266df16f590c4519ad94";
        hash = "sha256-8dvhgeKa7r0vSv/6Im0aNqrEAn3/7A5FghEBt/w3LhQ=";
      };
    };
  });
  meta = {
    description = "\n    This package provides four basic examples for TurtleBot3 (i.e., interactive marker, object detection, patrol and position control).\n  ";
  };
})
