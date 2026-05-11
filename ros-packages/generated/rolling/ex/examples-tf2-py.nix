{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch-ros,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  substituteSource,
  tf2-ros-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "examples_tf2_py";
  version = "0.46.0-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedNativeBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "b5094589868656a35c6d8fb63c67e7d4901eacb0";
        hash = "sha256-u/lZxH4l6I7OYlhH7ZYniTY1xoKTywJIr0A9o+ov02I=";
      };
    };
  });
  meta = {
    description = "\n    Has examples of using the tf2 Python API.\n  ";
  };
})
