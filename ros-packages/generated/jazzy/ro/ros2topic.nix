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
  version = "0.32.1-1";
  src = finalAttrs.passthru.sources."ros2topic";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-numpy" "python3-yaml" ]; };
  propagatedBuildInputs = [ rclpy ros2cli rosidl-runtime-py ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint geometry-msgs launch launch-ros launch-testing launch-testing-ros rosgraph-msgs std-msgs test-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" "python3-pytest-timeout" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "ros2topic" = substituteSource {
        src = fetchgit {
          name = "ros2topic-source";
          url = "https://github.com/ros2-gbp/ros2cli-release.git";
          rev = "f95e34ae173e6bc94e70e3aa8cc63bfd99d4e216";
          hash = "sha256-i2HNgtWFUYxZ0nKYGTzkLR7khK1Hnzp5nPQMtt4yWWc=";
        };
      };
    });
  };
  meta = {
    description = "The topic command for ROS 2 command line tools.";
  };
})
