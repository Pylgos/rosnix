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
  version = "0.29.0-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "7bc14dabff7384a9a56acbd507804b87e8a2bf46";
        hash = "sha256-Xl68NODWGKri/uJZ8Z3Pr6WJNwXBgVQUdPXe7BCDr9w=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
