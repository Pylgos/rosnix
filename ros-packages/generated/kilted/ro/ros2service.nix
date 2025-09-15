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
  ros2topic,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2service";
  version = "0.38.1-1";
  src = finalAttrs.passthru.sources."ros2service";
  propagatedNativeBuildInputs = [ rclpy ros2cli ros2topic rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ros2cli ros2topic rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-ros launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2service" = substituteSource {
      src = fetchgit {
        name = "ros2service-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "f83246b28373a8e94274ecd08d06604f2395b550";
        hash = "sha256-yExNURpKmwpklEw6cO3AvDW9SIm/N1a/zd89LrRCWjc=";
      };
    };
  });
  meta = {
    description = "\n    The service command for ROS 2 command line tools.\n  ";
  };
})
