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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedBuildInputs = [ action-msgs ament-index-python rclpy ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2action" = substituteSource {
        src = fetchgit {
          name = "ros2action-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "28aef19d429d83f5e135a724dc63f83097fbe792";
          hash = "sha256-/PSvmfbQBmQ9GmPYUoTPBfgOs60p6W9yQ+xOiwp6JMA=";
        };
      };
    });
  };
  meta = {
    description = "The action command for ROS 2 command line tools.";
  };
})
