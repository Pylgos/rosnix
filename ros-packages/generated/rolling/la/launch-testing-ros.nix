{
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch-ros,
  launch-testing,
  mkSourceSet,
  rclpy,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing_ros";
  version = "0.28.0-1";
  src = finalAttrs.passthru.sources."launch_testing_ros";
  propagatedBuildInputs = [ ament-index-python launch-ros launch-testing rclpy ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ros" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "3c999ac944ce2b65440d9c0cacf6e2ec9d263b57";
        hash = "sha256-OVoAVzQcq8UWpaK+KdVxxQCyIvCqZTUxiAOgv8C7v/0=";
      };
    };
  });
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
})
