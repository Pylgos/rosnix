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
  version = "0.34.0-1";
  src = finalAttrs.passthru.sources."rosbag2_examples_py";
  propagatedNativeBuildInputs = [ example-interfaces rclpy rosbag2-compression rosbag2-py rosidl-runtime-py std-msgs ];
  propagatedBuildInputs = [ example-interfaces rclpy rosbag2-compression rosbag2-py rosidl-runtime-py std-msgs ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "rosbag2_examples_py" = substituteSource {
      src = fetchgit {
        name = "rosbag2_examples_py-source";
        url = "https://github.com/ros2-gbp/rosbag2-release.git";
        rev = "d3d09b96238e091e0788663b7b54c75592479a02";
        hash = "sha256-tCU6yLAaacmppn24rAAG4afEFAaRp0p/ZRk2ig3k+eI=";
      };
    };
  });
  meta = {
    description = "Python bag writing tutorial";
  };
})
