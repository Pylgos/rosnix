{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_examples_py";
  version = "0.26.5-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "abb1148658689d3084410fab326b3a7e9226e8aa";
        hash = "sha256-gbsmLKyygTEyDTCQ3LVP4wDvwEOhuHvsKzH+QYIgxE0=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
