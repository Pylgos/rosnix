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
  version = "0.8.0-1";
  src = finalAttrs.passthru.sources."ros2test";
  propagatedNativeBuildInputs = [ domain-coordinator ];
  propagatedBuildInputs = [ launch launch-ros launch-testing launch-testing-ros ros2cli ];
  checkInputs = [ ament-copyright ament-flake8 ament-pep257 ament-xmllint ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "ros2test" = substituteSource {
      src = fetchgit {
        name = "ros2test-source";
        url = "https://github.com/ros2-gbp/ros_testing-release.git";
        rev = "76c33c26b084db0fe1621bdb767456bc4741c4e9";
        hash = "sha256-Rjb0XZ/AEm0GQQYCvhimXlNeZjAZlyaKWjOb8r0Ap5c=";
      };
    };
  });
  meta = {
    description = "The test command for ROS 2 launch tests.";
  };
})
