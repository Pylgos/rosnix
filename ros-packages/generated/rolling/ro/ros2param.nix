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
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."ros2param";
  propagatedNativeBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  propagatedBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2param" = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "fdafa1de0eb584ac735a19b8ddb7bb7c61a7ed71";
        hash = "sha256-nNkjQqrW7BKiUDn5WgDRD44RQEYIaP7zWHwCnXMKKTY=";
      };
    };
  });
  meta = {
    description = "\n    The param command for ROS 2 command line tools.\n  ";
  };
})
