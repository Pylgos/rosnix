{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  substituteSource,
  tf2-ros,
  turtlesim-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "turtle_tf2_py";
  version = "0.6.3-1";
  src = finalAttrs.passthru.sources."turtle_tf2_py";
  propagatedBuildInputs = [ geometry-msgs launch launch-ros rclpy tf2-ros turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtle_tf2_py" = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "3c2706c7a9d09b819c1dab0ee6e13baee0eaeb82";
        hash = "sha256-W6IJ7EUAKM53HksI3+gif9R6T8mIfP4Bb+IDa9GlzXE=";
      };
    };
  });
  meta = {
    description = "turtle_tf2_py demonstrates how to write a ROS2 Python tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.";
  };
})
