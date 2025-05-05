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
  version = "0.32.4-1";
  src = finalAttrs.passthru.sources."ros2action";
  propagatedNativeBuildInputs = [ rclpy ];
  propagatedBuildInputs = [ action-msgs ament-index-python ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint launch launch-testing launch-testing-ros test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2action" = substituteSource {
      src = fetchgit {
        name = "ros2action-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "4218ff2718db7f99b20c2c999b0a1ef1bed16993";
        hash = "sha256-0K/gmPkTRZ/AfUVlsxPcUYH3p+9H7LS02UzrvaK/t5Y=";
      };
    };
  });
  meta = {
    description = "The action command for ROS 2 command line tools.";
  };
})
