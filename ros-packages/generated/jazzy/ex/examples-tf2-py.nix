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
  version = "0.36.5-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_tf2_py" = substituteSource {
        src = fetchgit {
          name = "examples_tf2_py-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "ebd3bf2f237878a219a9eef7beb99f269db9b566";
          hash = "sha256-x/Gt+oaCGIxsVFcd59ghmnBXRiWujozSUt/zMf5A2oo=";
        };
      };
    });
  };
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
})
