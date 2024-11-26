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
  version = "0.36.0-1";
  src = finalAttrs.passthru.sources."ros2node";
  propagatedBuildInputs = [ rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros rclpy test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2node" = substituteSource {
        src = fetchgit {
          name = "ros2node-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "90714093d5ccf0b901e08455804660580841991a";
          hash = "sha256-VBfU3HKsfyIQ5tt0TPDLOuSOYqDXoLSLhKiiXUK+cns=";
        };
      };
    });
  };
  meta = {
    description = "The node command for ROS 2 command line tools.";
  };
})
