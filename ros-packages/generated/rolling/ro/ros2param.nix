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
  rcl-interfaces,
  rclpy,
  ros2cli,
  ros2node,
  ros2service,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2param";
  version = "0.36.1-1";
  src = finalAttrs.passthru.sources."ros2param";
  propagatedBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2param" = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "1dcc2012ea25e3183d1bed7c8e9d6af7125371c3";
        hash = "sha256-qnS5mipKrxoQbroFLOozWRlSt1y2/1tdKS6tEIDKTn0=";
      };
    };
  });
  meta = {
    description = "The param command for ROS 2 command line tools.";
  };
})
