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
  rosbag2-py,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_examples_py";
  version = "0.33.0-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy rosbag2-py rosidl-runtime-py std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py rosidl-runtime-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "87bde539987f19a18574f6a7d41b1bf095225b67";
        hash = "sha256-oXMmQz+HlFtVHa/5cLpNfoI06dUQGQ8Qyuk9WwAH69w=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
