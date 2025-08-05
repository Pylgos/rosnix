{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2node";
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."ros2node";
  propagatedNativeBuildInputs = [ rclpy ros2cli ];
  propagatedBuildInputs = [ rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros rclpy test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2node" = substituteSource {
      src = fetchgit {
        name = "ros2node-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "a40cbe17b0a1a176eca4377596aba99eb5d12ad5";
        hash = "sha256-pTJd+w8EPnSkkn8mjdQyUwgU6AsxjuTI1BLH9HQibwQ=";
      };
    };
  });
  meta = {
    description = "\n    The node command for ROS 2 command line tools.\n  ";
  };
})
