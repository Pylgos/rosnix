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
  ros2topic,
  rosSystemPackages,
  rosidl-runtime-py,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2action";
  version = "0.38.1-1";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedNativeBuildInputs = [ action-msgs ament-index-python rclpy ros2cli ros2topic rosidl-runtime-py ];
  propagatedBuildInputs = [ action-msgs ament-index-python rclpy ros2cli ros2topic rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2action" = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "0f86dea6a24c6bf5fd8184b95366c76dbd123ffd";
        hash = "sha256-DPwiYtVUKkSnc4hbvFKjdqXacIgtkKGZqf1QMIffUHU=";
      };
    };
  });
  meta = {
    description = "\n    The action command for ROS 2 command line tools.\n  ";
  };
})
