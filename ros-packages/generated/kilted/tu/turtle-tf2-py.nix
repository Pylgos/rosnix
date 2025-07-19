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
  version = "0.6.4-1";
  src = finalAttrs.passthru.sources."turtle_tf2_py";
  propagatedNativeBuildInputs = [ geometry-msgs launch launch-ros rclpy tf2-ros turtlesim-msgs ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" ]; };
  propagatedBuildInputs = [ geometry-msgs launch launch-ros rclpy tf2-ros turtlesim-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "turtle_tf2_py" = substituteSource {
      src = fetchgit {
        name = "turtle_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry_tutorials-release.git";
        rev = "4778fe5160edb8da4f74acec1fece90b12ea7d00";
        hash = "sha256-/C6m+FldN2A7JuhXIU6i//yreBNTHVoh8bU0TpIIh04=";
      };
    };
  });
  meta = {
    description = "\n    turtle_tf2_py demonstrates how to write a ROS2 Python tf2 broadcaster and listener with the turtlesim. The turtle_tf2_listener commands turtle2 to follow turtle1 around as you drive turtle1 using the keyboard.\n  ";
  };
})
