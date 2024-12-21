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
  version = "0.26.6-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "c2b59fd1002bf97995988e1f2e69ddd3655ebe48";
        hash = "sha256-deW01hfhXqEuwqsULON7+1ye+GJxiQ8jBuSUoTAYO8s=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
