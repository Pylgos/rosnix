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
  version = "0.39.1-1";
  src = finalAttrs.passthru.sources."ros2param";
  propagatedNativeBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  propagatedBuildInputs = [ rcl-interfaces rclpy ros2cli ros2node ros2service ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2param" = substituteSource {
      src = fetchgit {
        name = "ros2param-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "c8b330248aa0f75b344a1e9d2724d6b8da6b04f9";
        hash = "sha256-ATPWZW/tIVEire+5al629q63kIqDnudVmTiq0iBXW58=";
      };
    };
  });
  meta = {
    description = "\n    The param command for ROS 2 command line tools.\n  ";
  };
})
