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
  version = "0.26.7-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "2e8d6dd627fc7b775edad1edc51a0c1170e430a2";
        hash = "sha256-Ss91UzaclhxMamTkCmcvz+BawMy/0i0+btLRZ8mrpUE=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
