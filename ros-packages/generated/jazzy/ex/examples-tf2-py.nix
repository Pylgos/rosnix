{
  ament-copyright,
  ament-flake8,
  ament-pep257,
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
  version = "0.36.18-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedNativeBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "9a88c55147d30cad5fcb821b0985c89343c74c41";
        hash = "sha256-GijRHrjvtc3jbY16BNb/ySQAJK9EMAdbjnjlzK3wEdo=";
      };
    };
  });
  meta = {
    description = "\n    Has examples of using the tf2 Python API.\n  ";
  };
})
