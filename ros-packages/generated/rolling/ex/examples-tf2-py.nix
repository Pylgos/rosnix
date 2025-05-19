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
  version = "0.42.1-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedNativeBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "0d2fc7cc3ca8c89bc53debcf99fed51285b88967";
        hash = "sha256-yPrwfWSgvOLJVWq3kSxUjAartF6ai14gjrm/CBAc9C8=";
      };
    };
  });
  meta = {
    description = "\n    Has examples of using the tf2 Python API.\n  ";
  };
})
