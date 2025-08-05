{
  action-msgs,
  ament-copyright,
  ament-flake8,
  ament-index-python,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2action";
  version = "0.40.0-1";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedNativeBuildInputs = [ action-msgs ament-index-python rclpy ros2cli rosidl-runtime-py ];
  propagatedBuildInputs = [ action-msgs ament-index-python rclpy ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2action" = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "14408e68d6cf5a0a15367790a31bfad42350a01d";
        hash = "sha256-xKuiNz49xAnCMqqbuETbPaXVUFoP2WoBHXBdQ8o21y0=";
      };
    };
  });
  meta = {
    description = "\n    The action command for ROS 2 command line tools.\n  ";
  };
})
