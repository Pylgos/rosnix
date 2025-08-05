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
  rmw-test-fixture-implementation,
  rosSystemPackages,
  std-msgs,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "launch_testing_ros";
  version = "0.29.2-1";
  src = finalAttrs.passthru.sources."launch_testing_ros";
  propagatedNativeBuildInputs = [ ament-index-python launch-ros launch-testing rclpy rmw-test-fixture-implementation ];
  propagatedBuildInputs = [ ament-index-python launch-ros launch-testing rclpy rmw-test-fixture-implementation ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ros" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "45b82be59ed79cf4db4e032df38325913c07cb66";
        hash = "sha256-uTKLrIpjtcosYHAB9+qCkUcuBbnaAcbvT7FmKq2i1Z8=";
      };
    };
  });
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
})
