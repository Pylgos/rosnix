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
  version = "0.36.10-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ geometry-msgs launch-ros sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "examples_tf2_py" = substituteSource {
      src = fetchgit {
        name = "examples_tf2_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "a774f61acf2676b61aa5ff5bb05309d586183486";
        hash = "sha256-9+5QH+k3PbpnRKM75qLKlh856QYOmD14W+dIbkj7Blk=";
      };
    };
  });
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
})
