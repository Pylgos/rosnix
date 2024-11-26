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
  version = "0.39.3-1";
  src = finalAttrs.passthru.sources."examples_tf2_py";
  propagatedBuildInputs = [ geometry-msgs launch-ros rclpy sensor-msgs tf2-ros-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "examples_tf2_py" = substituteSource {
        src = fetchgit {
          name = "examples_tf2_py-source";
          url = "https://github.com/ros2-gbp/geometry2-release.git";
          rev = "95d648183ab40f1bc0ec6d9e60b769a754cb2612";
          hash = "sha256-xXRyYo0buRzDmPedhGHyykTNGQr2GVUGz6lAEn4vegg=";
        };
      };
    });
  };
  meta = {
    description = "Has examples of using the tf2 Python API.";
  };
})
