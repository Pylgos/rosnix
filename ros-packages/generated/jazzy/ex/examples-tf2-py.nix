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
  version = "0.36.8-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "108c8982a3a23d9afb9ccc8c6ec9ec83512205d1";
        hash = "sha256-8EMz2hN6AsxJ6XN8biXfxeudu/KZYJf2i02CUdoTgkE=";
      };
    };
  });
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
})
