{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  example-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  rosbag2-compression,
  rosbag2-py,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_examples_py";
  version = "0.33.1-2";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy rosbag2-compression rosbag2-py rosidl-runtime-py std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-compression rosbag2-py rosidl-runtime-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "f1c15b84c05de91502437c0b20b2279cdd22a563";
        hash = "sha256-+TO4WN4M2fgt0YpCYIi2wacam5h3FXPEtZKJ1dbxGf8=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
