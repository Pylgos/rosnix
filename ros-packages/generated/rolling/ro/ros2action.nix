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
  version = "0.39.0-1";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ action-msgs ament-index-python ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2action" = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "11fa4da8beb0e970df2f54ac60723fd4cce6af11";
        hash = "sha256-gBveVEwC9ui8ZhVIlkl8GiSgWe4apUvH4bR77UvuNVk=";
      };
    };
  });
  meta = {
    description = "The action command for ROS 2 command line tools.";
  };
})
