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
  version = "0.29.5-1";
  src = finalAttrs.passthru.sources."launch_testing_ros";
  propagatedNativeBuildInputs = [ ament-index-python launch-ros launch-testing rclpy rmw-test-fixture-implementation ];
  propagatedBuildInputs = [ ament-index-python launch-ros launch-testing rclpy rmw-test-fixture-implementation ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "launch_testing_ros" = substituteSource {
      src = fetchgit {
        name = "launch_testing_ros-source";
        url = "https://github.com/ros2-gbp/launch_ros-release.git";
        rev = "3684141f5cbc4033b2ef64700bae871505de7982";
        hash = "sha256-u2UbXNjVQGyQ24+2YgCDbxBL6EYgHxBD/hcZiOYYs/s=";
      };
    };
  });
  meta = {
    description = "A package providing utilities for writing ROS2 enabled launch tests.";
  };
})
