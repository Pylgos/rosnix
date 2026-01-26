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
  lifecycle-msgs,
  mkSourceSet,
  rclpy,
  ros2cli,
  ros2lifecycle-test-fixtures,
  ros2node,
  ros2service,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2lifecycle";
  version = "0.32.8-1";
  src = finalAttrs.passthru.sources."ros2lifecycle";
  propagatedNativeBuildInputs = [ lifecycle-msgs rclpy ros2cli ros2node ros2service ];
  propagatedBuildInputs = [ lifecycle-msgs rclpy ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ros2lifecycle-test-fixtures ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2lifecycle" = substituteSource {
      src = fetchgit {
        name = "ros2lifecycle-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "fd81b9909845da1605e8fd931fefed8118d1ef1e";
        hash = "sha256-XDxg6C806/QU57il8p+xokJB+pEp6cbTgaGBhjKa/Rk=";
      };
    };
  });
  meta = {
    description = "\n    The lifecycle command for ROS 2 command line tools.\n  ";
  };
})
