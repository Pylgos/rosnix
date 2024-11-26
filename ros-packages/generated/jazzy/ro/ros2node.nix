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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2node";
  propagatedBuildInputs = [ rclpy ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros rclpy test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2node" = substituteSource {
        src = fetchgit {
          name = "ros2node-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "a3f805865fbc26c9231798f40fedbdb052c1159d";
          hash = "sha256-ldTUVQjlf++mL5uLb/d4St3RX/MYVIKuO1AhFn9GnkQ=";
        };
      };
    });
  };
  meta = {
    description = "The node command for ROS 2 command line tools.";
  };
})
