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
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  sensor-msgs,
  std-msgs,
  substituteSource,
  tf2-msgs,
  tf2-py,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "tf2_ros_py";
  version = "0.46.0-1";
  src = finalAttrs.passthru.sources."tf2_ros_py";
  propagatedNativeBuildInputs = [ geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  propagatedBuildInputs = [ geometry-msgs rclpy sensor-msgs std-msgs tf2-msgs tf2-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "tf2_ros_py" = substituteSource {
      src = fetchgit {
        name = "tf2_ros_py-source";
        url = "https://github.com/ros2-gbp/geometry2-release.git";
        rev = "c155c25a091e6f8364d3a22a88e2d91eb69eba00";
        hash = "sha256-vYCTfb3xXf6ugCMjTZxbH2Soea73S9qypK5z/ScRpls=";
      };
    };
  });
  meta = {
    description = "\n    This package contains the ROS Python bindings for the tf2 library\n  ";
  };
})
