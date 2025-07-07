{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  rclpy,
  ros2cli,
  rosSystemPackages,
  rosgraph-msgs,
  rosidl-runtime-py,
  std-msgs,
  substituteSource,
  test-msgs,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2topic";
  version = "0.39.2-1";
  src = finalAttrs.passthru.sources."ros2topic";
  propagatedNativeBuildInputs = [ rclpy ros2cli rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl-runtime-py ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint geometry-msgs launch launch-ros launch-testing launch-testing-ros rosgraph-msgs std-msgs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2topic" = substituteSource {
      src = fetchgit {
        name = "ros2topic-source";
        url = "https://github.com/ros2-gbp/ros2cli-release.git";
        rev = "b991db5f3f528f6bc87737c63d60fcceb948e0e3";
        hash = "sha256-TDtJfWbFMbv8ziiWOzfVF4JIrFcuxKa8NPNZ49msk4o=";
      };
    };
  });
  meta = {
    description = "\n    The topic command for ROS 2 command line tools.\n  ";
  };
})
