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
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "rosbag2_examples_py";
  version = "0.26.9-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy rosbag2-py rosidl-runtime-py std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-py rosidl-runtime-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "ea95d6e81167e1094a09efd5e2e79d0b41bc10d9";
        hash = "sha256-wPLRXaq0nC/ZmnxEqvjcqK6RKflZbNf2IZOk/I87jbg=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
