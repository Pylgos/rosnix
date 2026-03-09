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
  version = "0.38.3-2";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedNativeBuildInputs = [ action-msgs ament-index-python rclpy ros2cli ros2topic rosidl-runtime-py ];
  propagatedBuildInputs = [ action-msgs ament-index-python rclpy ros2cli ros2topic rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2action" = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "113fecfe3eddb8ab4bdac1d81b2c219dad01a12b";
        hash = "sha256-m0X/IUlTJJEA2x7lcLRjg6NOBGTCs5ucOMgYif0IeVY=";
      };
    };
  });
  meta = {
    description = "\n    The action command for ROS 2 command line tools.\n  ";
  };
})
