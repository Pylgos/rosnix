{
  ament-copyright,
  ament-flake8,
  ament-pep257,
  ament-xmllint,
  buildAmentPythonPackage,
  domain-coordinator,
  fetchgit,
  fetchurl,
  fetchzip,
  launch,
  launch-ros,
  launch-testing,
  launch-testing-ros,
  mkSourceSet,
  ros2cli,
  rosSystemPackages,
  substituteSource,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "ros2test";
  version = "0.10.0-1";
  src = finalAttrs.passthru.sources."ros2test";
  propagatedNativeBuildInputs = [ domain-coordinator launch launch-ros launch-testing launch-testing-ros ros2cli ];
  propagatedBuildInputs = [ domain-coordinator launch launch-ros launch-testing launch-testing-ros ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2test" = substituteSource {
      src = fetchgit {
        name = "ros2test-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "a194cc60342285ac56b5f1c96504e43851923984";
        hash = "sha256-FBGfPda0GnRDnbEl2UWahMi1yV+AtHMNmflEqBxZV/M=";
      };
    };
  });
  meta = {
    description = "The test command for ROS 2 launch tests.";
  };
})
