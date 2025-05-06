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
  version = "0.7.0-1";
  src = finalAttrs.passthru.sources."turtle_tf2_py";
  propagatedNativeBuildInputs = [ geometry-msgs launch launch-ros rclpy tf2-ros turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ geometry-msgs launch launch-ros rclpy tf2-ros turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtle_tf2_py" = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "8b7e40390589e0d0fbca159dafc90b0bb845ec44";
        hash = "sha256-TtgVfu3WfDgpViIk10fCbyaogmu9p1jeMWMu2fjv9YU=";
      };
    };
  });
  meta = {
    description = "\n    turtle_tf2_py demonstrates how to write a ROS2 Python tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.\n  ";
  };
})
