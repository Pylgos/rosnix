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
  version = "0.38.1-1";
  src = finalAttrs.passthru.sources."ros2node";
  propagatedNativeBuildInputs = [ rclpy ros2cli ];
  propagatedBuildInputs = [ rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros rclpy test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2node" = substituteSource {
      src = fetchgit {
        name = "ros2node-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "5e59ee4fb35b7aa8d5f44f9cb93ce0638c6d0a02";
        hash = "sha256-7NZPmUSxxmuW0m+lNziMZ+f+k1e+6tska5rS+TS3CVc=";
      };
    };
  });
  meta = {
    description = "\n    The node command for ROS 2 command line tools.\n  ";
  };
})
